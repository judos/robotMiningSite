require "config"
require "libs.all"
require "libs.control.entities"

require "control.robotMiningSite"
require "control.miningRobot"
require "control.forces"
require "control.speedTechnology"
require "control.migration_0_2_0"
require "control.migration_0_2_3"
require "control.migration_0_3_0"
require "control.migration_0_4_1"
require "control.migration_0_8_0"

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
local function initialize(oldVersion, newVersion)

	entities_init()
	if not oldVersion then
		global.robotMiningSite = {}
		speedTechnologyInit()
		info("Initialised")
	end
	
	if oldVersion then
		if oldVersion and oldVersion < "00.02.00" then migration_0_2_0() end
		if oldVersion and oldVersion < "00.02.03" then migration_0_2_3() end
		if oldVersion and oldVersion < "00.03.00" then migration_0_3_0() end
		if oldVersion and oldVersion < "00.04.01" then migration_0_4_1() end
		if oldVersion and oldVersion < "00.08.00" then migration_0_8_0() end
		
		if newVersion > oldVersion then
			error("Using savegame with newer robotMiningSite version ("..newVersion..") than installed version ("..oldVersion..")")
			newVersion = oldVersion
		end
		if newVersion ~= oldVersion then
			info("Previous version: "..tostring(oldVersion).." migrated to "..newVersion)
		end
	end
end

local function on_init()
	entities_init()
	if not global.robotMiningSite then
		global.robotMiningSite = {}
	end
end

local function on_load()

end
script.on_init(function()
  -- format version string to "00.00.00"
  local oldVersion, newVersion = nil
  local newVersionString = game.active_mods[modName]
  if newVersionString then
    newVersion = format_version(newVersionString)
  end
  initialize(oldVersion, newVersion)
end)

script.on_configuration_changed(function(data)
  if data and data.mod_changes[modName] then
    -- format version string to "00.00.00"
    local oldVersion, newVersion = nil
    local oldVersionString = data.mod_changes[modName].old_version
    if oldVersionString then
      oldVersion = format_version(oldVersionString)
    end
    local newVersionString = data.mod_changes[modName].new_version
    if newVersionString then
      newVersion = format_version(newVersionString)
    end

  end
end)
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
	entities_pre_mined(event)
end)

script.on_event(defines.events.on_pre_player_mined_item, function(event)
	entities_pre_mined(event)
end)
