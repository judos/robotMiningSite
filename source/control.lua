require "defines"
require "config"
require "libs.functions"
require "libs.controlFunctions"
require "control.robotMiningSite"
require "control.miningRobot"
require "control.forces"

local robotMiningSiteName = "robotMiningSite"
local miningRobot = "mining-robot"

-- global data stored and used:
-- global.robotMiningSite.schedule[tick] = { entity, ... }
-- global.robotMiningSite.entityData[idEntity] = { name="NAME" }

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
	local d = global.robotMiningSite
	info("robotMiningSite data = "..serpent.block(d))
	if not d then
		d = {}
		global.robotMiningSite = d
		d.version = "0.1.0"
		d.schedule = {}
	end
	if not d.schedule then
		d.schedule = {}
	end
	if not d.entityData then d.entityData={} end
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
		if entity and entity.valid then
			local data = global.robotMiningSite.entityData[idOfEntity(entity)]
			if entity.name == robotMiningSiteName then
				local nextUpdateInXTicks, reasonMessage = runMiningSiteInstructions(entity,data)
				if reasonMessage then
					info(robotMiningSiteName.." at " .. entity.position.x .. ", " ..entity.position.y .. ": "..reasonMessage)
				end
				if nextUpdateInXTicks then
					scheduleAdd(entity, game.tick + nextUpdateInXTicks)
				else
					-- if no more update is scheduled, remove it from memory
					-- nothing to be done here, the entity will just not be scheduled anymore
				end
			end
		else
			warn("updating entity failed:")
			warn(tostring(serpent.block(entity)).." isValid="..tostring(entity.valid))
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
	entityBuilt(event)
end)
script.on_event(defines.events.on_robot_built_entity, function(event)
	entityBuilt(event)
end)

function entityBuilt(event)
	local entity = event.created_entity
	local name = entity.name
	local data = nil
	if name == robotMiningSiteName then
		data = miningSiteWasBuilt(entity)
	elseif name == miningRobot then
		miningRobotWasBuilt(entity)
	end
	if data then global.robotMiningSite.entityData[idOfEntity(entity)]=data end
end

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
