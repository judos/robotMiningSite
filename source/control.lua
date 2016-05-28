require "defines"
require "config"
require "libs.functions"
require "libs.controlFunctions"

require "control.robotMiningSite"
require "control.miningRobot"
require "control.forces"
require "control.migration_0_2_0"
require "control.migration_0_2_3"
require "control.migration_0_3_0"
require "control.speedTechnology"

local robotMiningSiteName = "robotMiningSite-new"
local robotMiningSiteNameLarge = "robotMiningSite-large"
local robotMiningSiteNameExtra = "robotMiningSite-extra"
local robotMiningSiteNameOld = "robotMiningSite"

-- global data stored and used:
-- global.robotMiningSite.schedule[tick][idEntity] = $entity
-- global.robotMiningSite.entityData[idEntity] = { name=$name, ... }
-- global.robotMiningSite.speedResearch = $research_level

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
	if not global.robotMiningSite then global.robotMiningSite = {version=modVersion} end
	local d = global.robotMiningSite
	if not d.schedule then d.schedule = {} end
	if not d.entityData then d.entityData={} end
	speedTechnologyInit()

	entities_init()
	local prevVersion = global.robotMiningSite.version
	if global.robotMiningSite.version < "0.2.0" then migration_0_2_0() end
	if global.robotMiningSite.version < "0.2.3" then migration_0_2_3() end
	if global.robotMiningSite.version < "0.3.0" then migration_0_3_0() end
	if global.robotMiningSite.version ~= prevVersion then
		info("Previous version: "..prevVersion..", migrated to: "..global.robotMiningSite.version)
	end
	if global.robotMiningSite.version < modVersion then global.robotMiningSite.version = modVersion end --no migration needed
	if global.robotMiningSite.version > modVersion then
		error("Using savegame with newer robotMiningSite version ("..global.robotMiningSite.version..") than installed version ("..modVersion..")")
		global.robotMiningSite.version = modVersion
	end
end

---------------------------------------------------
-- Tick
---------------------------------------------------
script.on_event(defines.events.on_tick, function(event)
	entities_tick()
end)

---------------------------------------------------
-- Building Entities
---------------------------------------------------

script.on_event(defines.events.on_built_entity, function(event)
	entities_build(event)
end)
script.on_event(defines.events.on_robot_built_entity, function(event)
	entities_build(event)
end)

---------------------------------------------------
-- Removing entities
---------------------------------------------------
script.on_event(defines.events.on_robot_pre_mined, function(event)
	preMined(event)
end)

script.on_event(defines.events.on_preplayer_mined_item, function(event)
	preMined(event)
end)

function preMined(event) --event table doesn't contain player_index when a robot mines the entity
	local entity = event.entity
	local name = entity.name
	if entity.name == robotMiningSiteName or name == robotMiningSiteNameLarge or name == robotMiningSiteNameExtra then
		preMineRobotMiningSite(event)
	end
end
