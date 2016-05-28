-- Entity
local miningRobot = deepcopy(data.raw["construction-robot"]["construction-robot"])
miningRobot.name = "mining-robot"
miningRobot.icon = "__robotMiningSite__/graphics/icons/mining-robot.png"
miningRobot.idle.filename = "__robotMiningSite__/graphics/entity/mining-robot.png"
miningRobot.in_motion.filename = "__robotMiningSite__/graphics/entity/mining-robot.png"
miningRobot.working.filename = "__robotMiningSite__/graphics/entity/mining-robot-working.png"

miningRobot.speed = 0.05
miningRobot.max_energy = "1MJ"
miningRobot.energy_per_tick = "0.02kJ"
miningRobot.speed_multiplier_when_out_of_energy = 0.5
miningRobot.energy_per_move = "3kJ"
miningRobot.minable.result = "mining-robot"
data:extend({miningRobot})

-- Recipe
data:extend({
	{
    type = "recipe",
    name = "mining-robot",
    enabled = true,
    ingredients =
    {
      {"construction-robot", 1},
      {"steel-axe", 2}
    },
    result = "mining-robot"
  }
})

-- Item
local item = deepcopy(data.raw["item"]["construction-robot"])
item.name = "mining-robot"
item.icon = "__robotMiningSite__/graphics/icons/mining-robot.png"
item.order = "a[robot]-c[mining-robot]"
item.place_result = "mining-robot"
data:extend({item})