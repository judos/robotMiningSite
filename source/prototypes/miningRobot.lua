-- Entity
local miningRobot = deepcopy(data.raw["construction-robot"]["construction-robot"])
miningRobot.name = "mining-robot"
miningRobot.icon = "__robotMiningSite__/graphics/icons/mining-robot.png"
miningRobot.idle.filename = "__robotMiningSite__/graphics/entity/mining-robot.png"
miningRobot.in_motion.filename = "__robotMiningSite__/graphics/entity/mining-robot.png"
miningRobot.working.filename = "__robotMiningSite__/graphics/entity/mining-robot-working.png"

miningRobot.max_energy = "3MJ" --double of construction robots
miningRobot.energy_per_tick = "0.1kJ" --double of construction robots
miningRobot.energy_per_move = "15kJ" --triple of construction robots
miningRobot.minable.result = "mining-robot"
miningRobot.order = "c[signal]-b[robotMiningSite]1"
data:extend({miningRobot})

-- Recipe
data:extend({
	{
    type = "recipe",
    name = "mining-robot",
    enabled = true,
    ingredients ={},
    result = "mining-robot"
  }
})


if robotMiningSite.settings.bobs == true then
  data.raw.recipe["mining-robot"].ingredients = {{"flying-robot-frame", 1}, {"robot-brain-construction", 1}, {"steel-plate", 2}}
else
  data.raw.recipe["mining-robot"].ingredients ={{"construction-robot", 1}, {"steel-plate", 2}}
end

if robotMiningSite.settings.botsmk == true then
    if data.raw.item["bob-construction-robot-2"] then
      local miningRobotMK2 = deepcopy(data.raw["construction-robot"]["mining-robot"])
      miningRobotMK2.name = "mining-robot-2"
      miningRobotMK2.icon = "__robotMiningSite__/graphics/icons/mining-robot-2.png"
      miningRobotMK2.idle.filename = "__robotMiningSite__/graphics/entity/mining-robot-2.png"
      miningRobotMK2.in_motion.filename = "__robotMiningSite__/graphics/entity/mining-robot-2.png"
      miningRobotMK2.working.filename = "__robotMiningSite__/graphics/entity/mining-robot-working-2.png"
      miningRobotMK2.max_energy = "4500kJ"
      miningRobotMK2.energy_per_tick = "120J"
      miningRobotMK2.energy_per_move = "1.5kJ"
      miningRobotMK2.minable.result = "mining-robot-2"
      miningRobotMK2.order = "c[signal]-b[robotMiningSite]2"
      miningRobotMK2.subgroup = "logistic-network"
      data:extend({miningRobotMK2})

      data:extend({
       {
        type = "recipe",
        name = "mining-robot-2",
        enabled = false,
        ingredients = {},
        result = "mining-robot-2",
       },
      })

    end

    if data.raw.item["bob-construction-robot-3"] then
      local miningRobotMK3 = deepcopy(data.raw["construction-robot"]["bob-construction-robot-3"])
      miningRobotMK3.name = "mining-robot-3"
      miningRobotMK3.icon = "__robotMiningSite__/graphics/icons/mining-robot-3.png"
      miningRobotMK3.idle.filename = "__robotMiningSite__/graphics/entity/mining-robot-3.png"
      miningRobotMK3.in_motion.filename = "__robotMiningSite__/graphics/entity/mining-robot-3.png"
      miningRobotMK3.working.filename = "__robotMiningSite__/graphics/entity/mining-robot-working-3.png"
      miningRobotMK3.max_energy = "6000kJ"
      miningRobotMK3.energy_per_tick = "150J"
      miningRobotMK3.energy_per_move = "15kJ"
      miningRobotMK3.minable.result = "mining-robot-3"
      miningRobotMK3.order = "c[signal]-b[robotMiningSite]3"
      miningRobotMK3.subgroup = "logistic-network"
      data:extend({miningRobotMK3})

      data:extend({
      {
        type = "recipe",
        name = "mining-robot-3",
        enabled = false,
        ingredients = {},
        result = "mining-robot-3",
      }
      })
    end

    if data.raw.item["bob-construction-robot-4"] then
      local miningRobotMK4 = deepcopy(data.raw["construction-robot"]["bob-construction-robot-4"])
      miningRobotMK4.name = "mining-robot-4"
      miningRobotMK4.icon = "__robotMiningSite__/graphics/icons/mining-robot-4.png"
      miningRobotMK4.idle.filename = "__robotMiningSite__/graphics/entity/mining-robot-4.png"
      miningRobotMK4.in_motion.filename = "__robotMiningSite__/graphics/entity/mining-robot-4.png"
      miningRobotMK4.working.filename = "__robotMiningSite__/graphics/entity/mining-robot-working-4.png"
      miningRobotMK4.max_energy = "7500kJ"
      miningRobotMK4.energy_per_tick = "160J"
      miningRobotMK4.energy_per_move = "15kJ"
      miningRobotMK4.minable.result = "mining-robot-4"
      miningRobotMK4.order = "c[signal]-b[robotMiningSite]4"
      miningRobotMK4.subgroup = "logistic-network"
      data:extend({miningRobotMK4})

      data:extend({
      {
        type = "recipe",
        name = "mining-robot-4",
        enabled = false,
        ingredients = {},
        result = "mining-robot-4",
      }
      })
    end

    if data.raw.item["bob-construction-robot-5"] then
      local miningRobotMK5 = deepcopy(data.raw["construction-robot"]["bob-construction-robot-5"])
      miningRobotMK5.name = "mining-robot-5"
      miningRobotMK5.icon = "__robotMiningSite__/graphics/icons/mining-robot-5.png"
      miningRobotMK5.idle.filename = "__robotMiningSite__/graphics/entity/mining-robot-5.png"
      miningRobotMK5.in_motion.filename = "__robotMiningSite__/graphics/entity/mining-robot-5.png"
      miningRobotMK5.working.filename = "__robotMiningSite__/graphics/entity/mining-robot-working-5.png"
      miningRobotMK5.max_energy = "1500kJ"
      miningRobotMK5.minable.result = "mining-robot-5"
      miningRobotMK5.order = "c[signal]-b[robotMiningSite]5"
      miningRobotMK5.subgroup = "logistic-network"
      data:extend({miningRobotMK5})

      data:extend({
      {
        type = "recipe",
        name = "mining-robot-5",
        enabled = false,
        ingredients = {},
        result = "mining-robot-5",
      }
      })
    end
end

-- Item
local item = deepcopy(data.raw["item"]["construction-robot"])
item.name = "mining-robot"
item.icon = "__robotMiningSite__/graphics/icons/mining-robot.png"
item.order = "a[robot]-c[mining-robot]"
item.place_result = "mining-robot"
data:extend({item})

if robotMiningSite.settings.botsmk == true then
      local item = deepcopy(data.raw["item"]["construction-robot"])
      item.name = "mining-robot-2"
      item.icon = "__robotMiningSite__/graphics/icons/mining-robot-2.png"
	  --item.subgroup = "logistic-network"
      item.order = "a[robot]-c[mining-robot-2]"
      item.place_result = "mining-robot-2"
      data:extend({item})

      local item = deepcopy(data.raw["item"]["construction-robot"])
      item.name = "mining-robot-3"
      item.icon = "__robotMiningSite__/graphics/icons/mining-robot-3.png"
	  --item.subgroup = "logistic-network"
      item.order = "a[robot]-c[mining-robot-3]"
      item.place_result = "mining-robot-3"
      data:extend({item})

      local item = deepcopy(data.raw["item"]["construction-robot"])
      item.name = "mining-robot-4"
      item.icon = "__robotMiningSite__/graphics/icons/mining-robot-4.png"
	  --item.subgroup = "logistic-network"
      item.order = "a[robot]-c[mining-robot-4]"
      item.place_result = "mining-robot-4"
      data:extend({item})

      local item = deepcopy(data.raw["item"]["construction-robot"])
      item.name = "mining-robot-5"
      item.icon = "__robotMiningSite__/graphics/icons/mining-robot-5.png"
	  --item.subgroup = "logistic-network"
      item.order = "a[robot]-c[mining-robot-5]"
      item.place_result = "mining-robot-5"
      data:extend({item})
end

-- recipe for uranium rubble and processing it to uranium ore
data:extend({
  {
    type = "item",
    name = "uranium-rubble",
    icon = "__robotMiningSite__/graphics/icons/uranium-rubble.png",
	  icon_size= 32,
    subgroup = "raw-resource",
    order = "g[uranium-rubble]",
    stack_size = 50
  }
 })
 data:extend({
  {
    type = "recipe",
    name = "uranium-rubble-cleaning",
  	category = "crafting-with-fluid",
  	energy_required = 5,
  	enabled = false,
    ingredients = 
    {
  		{"uranium-rubble", 10},
  		{type="fluid", name = "sulfuric-acid", amount = 10}
    },
    result = "uranium-ore",
	  result_count = 10
  }
})


-- recipe for thorium rubble and processing it to thorium ore
if data.raw.item["thorium-ore"] then
data:extend({
  {
    type = "item",
    name = "thorium-rubble",
    icon = "__robotMiningSite__/graphics/icons/uranium-rubble.png",
    icon_size= 32,
    subgroup = "raw-resource",
    order = "g[thorium-rubble]",
    stack_size = 50
  }
 })
 data:extend({
  {
    type = "recipe",
    name = "thorium-rubble-cleaning",
    category = "crafting-with-fluid",
    energy_required = 5,
    enabled = false,
    ingredients = 
    {
      {"thorium-rubble", 10},
      {type="fluid", name = "sulfuric-acid", amount = 10}
    },
    result = "thorium-ore",
    result_count = 10
  }
})
end