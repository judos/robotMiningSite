require "defines"
require "config"
require "libs.functions"

local entityName = "robotMiningSite"

-- global data stored and used:
-- global.robotMiningSite.schedule[tick] = { entity, ... }

---------------------------------------------------
-- Loading
---------------------------------------------------
script.on_init(function()
	onLoad()
end)
script.on_load(function()
	onLoad()
end)

function onLoad()
	if not global then
		global = {}
		game.forces.player.reset_technologies()
		game.forces.player.reset_recipes()
	end
	info("onload"..serpent.block(global.robotMiningSite))
	if not global.robotMiningSite then
		global.robotMiningSite = {}
		global.robotMiningSite.version = "0.1.0"
		global.robotMiningSite.schedule = {}
	end
	if not global.robotMiningSite.schedule then
		info("initialized global.schedule")
		global.robotMiningSite.schedule = {}
	end
end

---------------------------------------------------
-- Tick
---------------------------------------------------
script.on_event(defines.events.on_tick, function(event)
  -- if no updates are scheduled return
	if type(global.robotMiningSite.schedule[game.tick]) ~= "table" then
		return
	end
	for _,entity in pairs(global.robotMiningSite.schedule[game.tick]) do
		if entity and entity.valid and entity.name==entityName then
			local nextUpdateInXTicks, reasonMessage = runEntityInstructions(idEntity, entity)
			if reasonMessage ~= nil then
				info(entityName.." at " .. entity.position.x .. ", " ..entity.position.y .. ": "..reasonMessage)
			end
			if nextUpdateInXTicks ~= nil then
				scheduleAdd(entity, game.tick + nextUpdateInXTicks)
			else
				-- if no more update is scheduled, remove it from memory
				-- nothing to be done here, the entity will just not be scheduled anymore
			end
		else
			warn("updating entity failed:")
			warn(tostring(entity).." isValid="..tostring(entity.valid))
			-- if entity was removed, remove it from memory
			-- nothing to be done here, the entity will just not be scheduled anymore
		end
	end
	global.robotMiningSite.schedule[game.tick] = nil
end)

---------------------------------------------------
-- Building entities
---------------------------------------------------
script.on_event(defines.events.on_built_entity, function(event)
	if event.created_entity.name == entityName then
		entityBuilt(event.created_entity)
	end
end)
script.on_event(defines.events.on_robot_built_entity, function(event)
	if event.created_entity.name == entityName then
		entityBuilt(event.created_entity)
	end
end)

function entityBuilt(entity)
	info("Entity built in tick "..game.tick.." and added it for update tick")
	scheduleAdd(entity, game.tick + updateEveryTicks)
end

---------------------------------------------------
-- Removal of entities
---------------------------------------------------
-- because no coordinate is passed for the following functions, we take care of this in the tick method
--[[
script.on_event(defines.events.on_player_mined_item, function(event)
	if event.item_stack.name == entityName then ... end
end)
script.on_event(defines.events.on_robot_mined, function(event)
	if event.item_stack.name == entityName then ... end
end)
script.on_event(defines.events.on_entity_died, function(event)
	if event.item_stack.name == entityName then ... end
end)
]]--

---------------------------------------------------
-- Utility methods
---------------------------------------------------
-- Adds new entry to the scheduling table
function scheduleAdd(entity, nextTick)
	if global.robotMiningSite.schedule[nextTick] == nil then
		global.robotMiningSite.schedule[nextTick] = {}
	end
	table.insert(global.robotMiningSite.schedule[nextTick],entity)
end

function idOfEntity(entity)
	return string.format("%g_%g", entity.position.x, entity.position.y)
end
function entityOfId(id)
	local position = split(id,"_")
	local point = {tonumber(position[1]),tonumber(position[2])}
	local entities = game.surfaces.nauvis.find_entities{point,point}
	if entities == nil then return nil end
	if #entities == 0 then return nil end
	return entities[1]
end

---------------------------------------------------
-- Update methods
---------------------------------------------------

-- parameters: entity
-- return values: tickDelayForNextUpdate, reasonMessage
function runEntityInstructions(idOfEntity, entity)
	local network = entity.surface.find_logistic_network_by_position(entity.position,entity.force)
	if not network then	return updateEveryTicksWaiting,"no logistics network" end
	local robots = network.available_construction_robots
	robots = math.max(robots-9,0)
	if not robots then return updateEveryTicksWaiting,"no robots available" end
	
	local r = 10 --range
	local p = entity.position
	local searchArea = {{p.x - r, p.y - r}, {p.x + r, p.y + r}}
	local resources = entity.surface.find_entities_filtered{area = searchArea, type="resource"}
	if not resources or #resources == 0 then
		return updateEveryTicksWaiting,"no resources available"
	end
	
	local networkCell = network.find_cell_closest_to(entity.position)
	if not networkCell then return updateEveryTicksWaiting,"no network cell" end
	local energyRoboport = networkCell.owner
	if not energyRoboport then return updateEveryTicksWaiting,"no roboport found" end
	
	local detectCollision = {}
	for i=1,robots do
		local n = math.random(#resources)
		local stack = {name=resources[n].name,count=1}
		local position = resources[n].position
		if stack.name then
			-- check collision with other entities
			if not detectCollision[position.x] then detectCollision[position.x]={} end
			if not detectCollision[position.x][position.y] then
				local area = {{math.floor(position.x),math.floor(position.y)},{math.ceil(position.x),math.ceil(position.y)}}
				local count = entity.surface.count_entities_filtered{area=area}
				detectCollision[position.x][position.y] = count
			end
			if detectCollision[position.x][position.y] == 1 then
			
				if energyRoboport.energy >= energyPerMining then
					energyRoboport.energy = energyRoboport.energy - energyPerMining
				else
					return updateEveryTicksWaiting,"roboport has no energy"
				end
				if resources[n].amount>1 then
					resources[n].amount = resources[n].amount - 1
				else
					resources[n].destroy()
					table.remove(resources,n)
					if #resources==0 then break end
				end
				
				local itemEntity = entity.surface.create_entity{stack=stack,position=position,name="item-on-ground"}
				detectCollision[position.x][position.y]=detectCollision[position.x][position.y]+1
				if itemEntity and itemEntity.valid then
					itemEntity.order_deconstruction(entity.force)
				end
			end
		end
	end
	
	return updateEveryTicks,"working..."
end
