if not robotMiningSite then robotMiningSite = {} end
if not robotMiningSite.settings then robotMiningSite.settings = {} end


if settings.startup["robotMiningSite_EasyT1"].value == true then
  robotMiningSite.settings.easyT1 = true
end

require "config"
require "libs.functions"

require "prototypes.fakeGeneratedItem"

require "prototypes.robotMiningSite"
require "prototypes.robotMiningSite-large"

require "prototypes.invisibleStorageChest"
require "prototypes.robot-chests"
require "prototypes.miningRoboport"
require "prototypes.miningRobot"
require "prototypes.circuitControl"

require "prototypes.miningRobotSpeedTechnology"
require "prototypes.technology"