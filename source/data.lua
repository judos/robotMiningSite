if not robotMiningSite then robotMiningSite = {} end
if not robotMiningSite.settings then robotMiningSite.settings = {} end


if settings.startup["robotMiningSite_EasyT1"].value == true then
  robotMiningSite.settings.easyT1 = true
end

if mods["boblogistics"] then
  if settings.startup["useBobRobotics"].value == true  then
    robotMiningSite.settings.bobs = true
  else
    robotMiningSite.settings.bobs = false
  end
  if settings.startup["useBotGrades"].value == true  then
    robotMiningSite.settings.botsmk = true
  else
    obotMiningSite.settings.botsmk = false
  end
  if settings.startup["needPreviousGrade"].value == true  then
    robotMiningSite.settings.botsUpgrade = true
  else
    robotMiningSite.settings.botsUpgrade = false
  end
else
  robotMiningSite.settings.bobs = false
  robotMiningSite.settings.botsmk = false
  robotMiningSite.settings.botsUpgrade = false
end

require "config"
require "libs.all"

require "prototypes.fakeGeneratedItem"

require "prototypes.robotMiningSite"
require "prototypes.robotMiningSite-large"
require "prototypes.miningSiteUpgrades"

require "prototypes.invisibleStorageChest"
require "prototypes.robot-chests"
require "prototypes.miningRoboport"
require "prototypes.miningRobot"
if mods["boblogistics"] then
  require "prototypes.miningRobot-recipe-updates"
end
require "prototypes.circuitControl"

require "prototypes.miningRobotSpeedTechnology"
require "prototypes.technology"
