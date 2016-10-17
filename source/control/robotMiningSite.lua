require "config"

-- Constants:
local SIZE_NORMAL = 1
local SIZE_LARGE = 2
local SIZE_EXTRA = 3

-- Register entity
local miningSite = {}
local f = {}
entities["robotMiningSite-new"] = miningSite
entities["robotMiningSite-large"] = miningSite
entities["robotMiningSite-extra"] = miningSite

miningSite.build = function(entity)
	scheduleAdd(entity, game.tick + updateEveryTicks)

	local sizeSuffix = ""
	local name = entity.name
	if name:ends("-large") then
		sizeSuffix = "-large"
	elseif name:ends("-extra") then
		sizeSuffix = "-extra"
	end
	local pos = {x = entity.position.x-0.5, y=entity.position.y+0.5}
	local miningRoboport = entity.surface.create_entity({name="mining-roboport"..sizeSuffix,position=pos,force=miningForceForEntity(entity)})
	miningRoboport.operable = false

	local pos = {x = entity.position.x-0.5, y=entity.position.y-0.5}
	local storageChest = entity.surface.create_entity({name="invisible-logistic-chest-storage",position=pos,force=miningForceForEntity(entity)})
	storageChest.operable = false

	local pos = {x = entity.position.x-1, y=entity.position.y+1}
	local control = entity.surface.create_entity({name="miningSite-control",position=pos,force=entity.force})
	local pos = {x = entity.position.x-1, y=entity.position.y+1}
	local controlOverlay = entity.surface.create_entity({name="miningSite-control-overlay",position=pos,force=entity.force})
	control.connect_neighbour{wire=defines.wire_type.green,target_entity=controlOverlay}
	
	controlOverlay.get_or_create_control_behavior().circuit_condition = {
		{
			condition={
				comparator="=",
				first_signal={type="item", name="iron-plate"},
				second_signal={type="item", name="iron-plate"}
			}
		}
	}
	
	local pos = {x = entity.position.x, y=entity.position.y+1}
	local robotChest = entity.surface.create_entity({name="robot-chest",position=pos,force=entity.force})
	
	
	local data = {
		miningRoboport = miningRoboport,
		storageChest = storageChest,
		control = control,
		controlOverlay = controlOverlay,
		robotChest = robotChest
	}
	for _,entity in pairs(data) do
		entity.minable = false
		entity.destructible = false
	end
	return data
end

miningSite.tick = function(entity,data)
	local nextUpdateInTicks,msg,res = f.checkCondition(entity,data)
	if msg == nil then
		moveInventoryToInventory(data.robotChest.get_inventory(defines.inventory.chest),data.miningRoboport.get_inventory(1))
		f.work(entity,data,res)
	else
		moveInventoryToInventory(data.miningRoboport.get_inventory(1),data.robotChest.get_inventory(defines.inventory.chest))
	end
	return nextUpdateInTicks,msg
end

f.checkCondition = function(entity,data)
	checkSizeOfMiningSite(entity,data)
	setOverlayIsOn(data)
	
	-- Move items, check space in chest
	local spaceLeft = moveItemsToPassiveProvider(entity,data)
	if not spaceLeft then -- stop mining if chest is full
		return updateEveryTicksWaiting,"no space in chest left"
	end

	-- Energy
	if not hasEnoughEnergy(entity,data) then return updateEveryTicksWaiting,"not enough energy" end

	-- Logistics condition
	if not circuitConditionIsOk(entity,data) then
		return updateEveryTicksWaiting,"logistics condition is false"
	end
	
	-- Resources
	local resources = findNearbyResources(entity,data)
	if not resources or #resources == 0 then
		return updateEveryTicksWaiting,"no resources available"
	end
	
	return updateEveryTicks,nil,resources
end


f.work = function(entity,data,resources)
	-- Network
	local network = data.miningRoboport.logistic_network
	if not network then	return updateEveryTicksWaiting,"no logistics network" end
	local totalRobots = network.all_construction_robots
	if (not totalRobots) or totalRobots==0 then	return updateEveryTicksWaiting,"no robots in network" end

	local robots = network.available_construction_robots
	if not data.freeBefore then data.freeBefore = robots end
	local delta = robots - data.freeBefore
	data.freeBefore = robots
	if delta<0 then return updateEveryTicks,"no robots available" end

	local testStack = {name="iron-ore",count=1}
	local forceName = miningForceForEntity(entity)

	for i=1,robots+5 do
		local n = math.random(#resources)
		local position = resources[n].position

		if entity.surface.can_place_entity{name="item-on-ground", position=position, stack=testStack} then
			local beltsCount = entity.surface.count_entities_filtered{position=position, type="transport-belt"}
			if beltsCount == 0 then
				local itemStacksGenerated = mineResource(resources[n])
				for _,itemStack in pairs(itemStacksGenerated) do
					local itemEntity = entity.surface.create_entity{name="item-on-ground", position=position, stack=itemStack}
					if itemEntity and itemEntity.valid then
						itemEntity.order_deconstruction(forceName)
					end
				end
			end
		end

		table.remove(resources,n)
		if #resources==0 then break end
	end

	if data.size == SIZE_EXTRA then
		return updateEveryTicks*2,nil
	end
	return updateEveryTicks,nil
end

miningSite.remove = function(data)
	-- final removal of robot mining site
	local inventoriesToClear = {
		{ data.miningRoboport.get_inventory(1), data.miningRoboport },
		{ data.storageChest.get_inventory(defines.inventory.chest), data.storageChest },
		{ data.robotChest.get_inventory(defines.inventory.chest), data.robotChest }
	}
	local surface = data.miningRoboport.surface
	for _,arr in pairs(inventoriesToClear) do
		if not arr[1].is_empty() then
			local inventory = arr[1].get_contents()
			warn("needs to spill: "..serpent.block(inventory))
			spillInventory(arr[1], surface, arr[2].position)
		end
		arr[2].destroy()
	end
	data.control.destroy()
	data.controlOverlay.destroy()
end



-- moves items from roboport / passive provider chest into robot mining site such that they are picked up by robot/player
miningSite.premine = function(entity,data,player)

	-- index 3 is defines.inventory.resultInventory (the current lua api does not contain the up-to-date indexes)
	local entityInv = entity.get_inventory(defines.inventory.chest)

	-- Move items from chests into robot mining site (player or bots pick them up)
	local inventoriesToClear = {
		data.miningRoboport.get_inventory(1),
		data.storageChest.get_inventory(defines.inventory.chest),
		data.robotChest.get_inventory(defines.inventory.chest)
	}
	for _,invToClear in pairs(inventoriesToClear) do
		if not moveInventoryToInventory(invToClear,entityInv) then
			break
		end
	end

	-- since the player mines it all items have to be moved
	if player then
		-- if playerIndex is set in events table, every item must be moved in this method from the input chests, otherwise items get lost
		local playerInventory = player.get_inventory(defines.inventory.player_main)
		for _,invToClear in pairs(inventoriesToClear) do
			if not moveInventoryToInventory(invToClear,playerInventory) then break end
		end
		for _,invToClear in pairs(inventoriesToClear) do
			if not invToClear.is_empty() then
				warn("needs to spill: "..serpent.block(invToClear.get_contents()))
				spillInventory(invToClear, entity.surface, entity.position)
			end
		end
	end
end




function findNearbyResources(entity,data)
	local r = miningRange --range
	if data.size == SIZE_LARGE then
		r = miningRangeLarge
	elseif data.size == SIZE_EXTRA then
		r = miningRangeExtra
	end
	local p = data.miningRoboport.position
	local searchArea = {{p.x - r, p.y - r}, {p.x + r, p.y + r}}
	return entity.surface.find_entities_filtered{type="resource", area = searchArea}
end

function checkSizeOfMiningSite(entity,data)
	if entity.name:ends("-large") then
		data.size = SIZE_LARGE
	elseif entity.name:ends("-extra") then
		data.size = SIZE_EXTRA
	else
		data.size = SIZE_NORMAL
	end
end


function moveItemsToPassiveProvider(entity,data)
	local invSource = data.storageChest.get_inventory(defines.inventory.chest)
	local invTarget = entity.get_inventory(defines.inventory.chest)
	local movedAll = moveInventoryToInventory(invSource,invTarget)
	killItemsInInventor(invTarget,"fake-generated-item")
	return movedAll
end

function hasEnoughEnergy(entity,data)
	local maxEnergyCapacity = capacityRoboport --MJ
	if data.size == SIZE_LARGE then
		maxEnergyCapacity = capacityRoboportLarge --MJ
	elseif data.size == SIZE_EXTRA then
		maxEnergyCapacity = capacityRoboportExtra --MJ
	end
	local currentEnergy = data.miningRoboport.energy
	return currentEnergy > miningSiteMinimalEnergy * maxEnergyCapacity * 1000000 --MJ to J conversion
end


function setOverlayIsOn(data)
	local behavior = data.control.get_or_create_control_behavior()
	local condition = behavior.circuit_condition
	local overlayOn = false
	if condition.condition.first_signal.name == nil then
		overlayOn = true
	end
	local overlayCondition = {
		condition = {
			comparator= (overlayOn and "=" or ">"),
			first_signal={type="item", name="iron-plate"},
			second_signal={type="item", name="iron-plate"}
		}
	}
	data.controlOverlay.get_or_create_control_behavior().circuit_condition = overlayCondition
end


function circuitConditionIsOk(entity,data)
	if entity.to_be_deconstructed(entity.force) then return false end

	local behavior = data.control.get_or_create_control_behavior()
	local condition = behavior.circuit_condition
	if not condition then return true end
	local parameters = condition.condition

	local checkFirstItem = parameters.first_signal.name
	if not checkFirstItem then return true end -- no condition specified

	local network = entity.logistic_network
	local actualAmount
	if network then
		actualAmount = network.get_item_count(checkFirstItem)
	else
		actualAmount = entity.get_inventory(defines.inventory.chest).get_item_count(checkFirstItem)
	end

	local compareAgainstAmount
	if parameters.second_signal then
		local checkSecondItem = parameters.second_signal.name
		if network then
			compareAgainstAmount = network.get_item_count(checkSecondItem)
		else
			compareAgainstAmount = entity.get_inventory(defines.inventory.chest).get_item_count(checkSecondItem)
		end
	else
		compareAgainstAmount = parameters.constant
	end

	local diff = actualAmount - compareAgainstAmount
	if parameters.comparator == ">" then
		return diff > 0
	elseif parameters.comparator == "=" then
		return diff == 0
	else
		return diff < 0
	end
end
