
function miningSiteWasBuilt(entity)
	info("Entity built in tick "..game.tick.." and added it for update tick")
	scheduleAdd(entity, game.tick + updateEveryTicks)
	
	local pos = {x = entity.position.x, y=entity.position.y+1}
	local storageChest = entity.surface.create_entity({name="logistic-chest-storage",position=pos,force=miningForceFor(entity)})
	storageChest.operable = false
	storageChest.minable = false
	storageChest.destructible = false
	local pos = {x = entity.position.x, y=entity.position.y-0.5}
	local miningRoboport = entity.surface.create_entity({name="mining-roboport",position=pos,force=miningForceFor(entity)})
	miningRoboport.operable = false
	miningRoboport.minable = false
	miningRoboport.destructible = false
	
	local pos = {x = entity.position.x-0.5, y=entity.position.y+1}
	local providerChest = entity.surface.create_entity({name="logistic-chest-passive-provider",position=pos,force=entity.force})
	providerChest.minable = false
	providerChest.destructible = false
	
	return {
		miningRoboport = miningRoboport,
		storageChest = storageChest,
		providerChest = providerChest
	}
end

function moveItemsToPassiveProvider(entity,data)
	local invSource = data.storageChest.get_inventory(defines.inventory.chest)
	local invTarget = data.providerChest.get_inventory(defines.inventory.chest)
	for itemName,count in pairs(invSource.get_contents()) do
		local stack={name=itemName,count=count}
		if invTarget.can_insert(stack) then
			stack.count = invSource.remove(stack)
			invTarget.insert(stack)
		else
			return false -- stop mining, chest is full
		end
	end
	return true -- space left, continue mining
end

-- parameters: entity
-- return values: tickDelayForNextUpdate, reasonMessage
function runMiningSiteInstructions(entity,data)
	local spaceLeft = moveItemsToPassiveProvider(entity,data)
	if not spaceLeft then
		return updateEveryTicksWaiting,"no space in chest left"
	end
	local r = 10 --range
	local p = entity.position
	local searchArea = {{p.x - r, p.y - r}, {p.x + r, p.y + r}}
	local resources = entity.surface.find_entities_filtered{type="resource", area = searchArea}
	if not resources or #resources == 0 then
		return updateEveryTicksWaiting,"no resources available"
	end
	
	local network = data.miningRoboport.logistic_network
	if not network then	return updateEveryTicksWaiting,"no logistics network" end
	
	local robots = network.available_construction_robots
	if not robots or robots==0 then return updateEveryTicks,"no robots available" end
	
	for i=1,robots+2 do
		local n = math.random(#resources)
		local stack = {name=resources[n].name,count=1}
		local position = resources[n].position
		if stack.name then
			-- check if mining is unobstructed
			if entity.surface.can_place_entity{name="item-on-ground", position=position, stack=stack} then
				if resources[n].amount>1 then
					resources[n].amount = resources[n].amount - 1
				else
					resources[n].destroy()
				end
				
				local itemEntity = entity.surface.create_entity{name="item-on-ground", position=position, stack=stack}
				if itemEntity and itemEntity.valid then
					local forceName = miningForceFor(entity)
					itemEntity.order_deconstruction(forceName)
				end
			end
			table.remove(resources,n)
			if #resources==0 then break end
		else
			warn("stack.name is nil for position: "..serpent.block(position).." and resource: "..serpent.block(resources[n]))
		end
	end
	
	return updateEveryTicks,"working..."
end