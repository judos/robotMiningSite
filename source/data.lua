if not robotMiningSite then robotMiningSite = {} end
if not robotMiningSite.settings then robotMiningSite.settings = {} end

robotMiningSite.settings.easyT1 = settings.startup["robotMiningSite_EasyT1"].value
robotMiningSite.settings.botsmk = settings.startup["useBotGrades"].value
robotMiningSite.settings.botsUpgrade = settings.startup["needPreviousGrade"].value

if mods["boblogistics"] then
  robotMiningSite.settings.bobs = settings.startup["useBobRobotics"].value
else
  robotMiningSite.settings.bobs = false
end

require "config"
require "libs.all"
require "category"

require "prototypes.fakeGeneratedItem"

require "prototypes.robotMiningSite"
require "prototypes.robotMiningSite-large"
require "prototypes.miningSiteUpgrades"

require "prototypes.invisibleStorageChest"
require "prototypes.robot-chests"
require "prototypes.miningRoboport"
require "prototypes.miningRobot"
require "prototypes.circuitControl"

require "prototypes.miningRobotSpeedTechnology"
require "prototypes.technology"
