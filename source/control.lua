require "config"
require "libs.functions"
require "libs.control.controlFunctions"
require "libs.control.entities"

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

-- global data stored and used:
-- global.robotMiningSite.speedResearch = $research_level
--                       .version = $version

---------------------------------------------------
-- Used API
---------------------------------------------------

-- entities V2

---------------------------------------------------
-- Loading
---------------------------------------------------
script.on_init(function()
	onLoad()
end)

local checkMigration = true
function onLoad()
	entities_init()
end

script.on_configuration_changed(function()
	if not global then
		global = {}
		game.forces.player.reset_technologies()
		game.forces.player.reset_recipes()
	end
	if not global.robotMiningSite then
		global.robotMiningSite = {}
	end
	local g = global.robotMiningSite
	info("Previous robotMiningSite version: "..g.version)
	if not g.version then
		g.version = "0.4.1"
		if not d.schedule then d.schedule = {} end
		if not d.entityData then d.entityData={} end
		speedTechnologyInit()
	end
	info("Migrated to version "..g.version)
end)

---------------------------------------------------
-- Tick
---------------------------------------------------
script.on_event(defines.events.on_tick, function(event)
	if checkMigration then
		migration()
		checkMigration = false
	end
	entities_tick()
end)

function migration()
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
	entities_pre_mined(event)
end)

script.on_event(defines.events.on_preplayer_mined_item, function(event)
	entities_pre_mined(event)
end)
