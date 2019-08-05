function miningrobot_idle(level)
  return {
      filename = "__robotMiningSite__/graphics/entity/mining-robot-"..level..".png",
      priority = "high",
      line_length = 16,
      width = 32,
      height = 36,
      frame_count = 1,
      shift = {0, -0.15625},
      direction_count = 16,
      --[[hr_version = {
        filename = "__robotMiningSite__/graphics/entity/mining-robot-"..level..".png",
        priority = "high",
        line_length = 16,
        width = 66,
        height = 76,
        frame_count = 1,
        shift = util.by_pixel(0,-4.5),
        direction_count = 16,
        scale = 0.5
      }]]
    }
end

function miningrobot_in_motion(level)
return {
      filename = "__robotMiningSite__/graphics/entity/mining-robot-"..level..".png",
      priority = "high",
      line_length = 16,
      width = 32,
      height = 36,
      frame_count = 1,
      shift = {0, -0.15625},
      direction_count = 16,
      y = 36,
     --[[ hr_version = {
        filename = "__robotMiningSite__/graphics/entity/mining-robot-"..level..".png",
        priority = "high",
        line_length = 16,
        width = 66,
        height = 76,
        frame_count = 1,
        shift = util.by_pixel(0, -4.5),
        direction_count = 16,
        y = 76,
        scale = 0.5
      }]]
    }
end

function miningrobot_working(level)
return {
      filename = "__robotMiningSite__/graphics/entity/mining-robot-working-"..level..".png",
      priority = "high",
      line_length = 2,
      width = 28,
      height = 36,
      frame_count = 2,
      shift = {0, -0.15625},
      direction_count = 16,
      animation_speed = 0.3,
      --[[hr_version = {
        filename = "__robotMiningSite__/graphics/entity/mining-robot-working-"..level..".png",
        priority = "high",
        line_length = 2,
        width = 57,
        height = 74,
        frame_count = 2,
        shift = util.by_pixel(-0.25, -5),
        direction_count = 16,
        animation_speed = 0.3,
        scale = 0.5
      }]]
    }
end


miningrobot_shadow = {
  filename = "__robotMiningSite__/graphics/entity/construction-robot-shadow.png",
  priority = "high",
  line_length = 16,
  width = 50,
  height = 24,
  frame_count = 1,
  shift = {1.09375, 0.59375},
  direction_count = 16,
  hr_version = {
    filename = "__robotMiningSite__/graphics/entity/hr-construction-robot-shadow.png",
    priority = "high",
    line_length = 16,
    width = 104,
    height = 49,
    frame_count = 1,
    shift = util.by_pixel(33.5, 18.75),
    direction_count = 16,
    scale = 0.5
  }
}

miningrobot_shadow_working = {
  stripes = util.multiplystripes(2,
    {
      {
        filename = "__robotMiningSite__/graphics/entity/construction-robot-shadow.png",
        width_in_frames = 16,
        height_in_frames = 1,
      }
    }
  ),
  priority = "high",
  line_length = 16,
  width = 50,
  height = 24,
  frame_count = 2,
  shift = {1.09375, 0.59375},
  direction_count = 16,
  hr_version = {
    stripes = util.multiplystripes(2,
      {
        {
          filename = "__robotMiningSite__/graphics/entity/hr-construction-robot-shadow.png",
          width_in_frames = 16,
          height_in_frames = 1,
        }
      }
    ),
    priority = "high",
    line_length = 16,
    width = 104,
    height = 49,
    frame_count = 2,
    shift = util.by_pixel(33.5, 18.75),
    direction_count = 16,
    scale = 0.5
  }
}



miningrobot_smoke = {
  filename = "__base__/graphics/entity/smoke-construction/smoke-01.png",
  width = 39,
  height = 32,
  frame_count = 19,
  line_length = 19,
  shift = {0.078125, -0.15625},
  animation_speed = 0.3,
}

miningrobot_sparks = {
  {
    filename = "__base__/graphics/entity/sparks/sparks-01.png",
    width = 39,
    height = 34,
    frame_count = 19,
    line_length = 19,
    shift = {-0.109375, 0.3125},
    tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
    animation_speed = 0.3,
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-02.png",
    width = 36,
    height = 32,
    frame_count = 19,
    line_length = 19,
    shift = {0.03125, 0.125},
    tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
    animation_speed = 0.3,
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-03.png",
    width = 42,
    height = 29,
    frame_count = 19,
    line_length = 19,
    shift = {-0.0625, 0.203125},
    tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
    animation_speed = 0.3,
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-04.png",
    width = 40,
    height = 35,
    frame_count = 19,
    line_length = 19,
    shift = {-0.0625, 0.234375},
    tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
    animation_speed = 0.3,
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-05.png",
    width = 39,
    height = 29,
    frame_count = 19,
    line_length = 19,
    shift = {-0.109375, 0.171875},
    tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
    animation_speed = 0.3,
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-06.png",
    width = 44,
    height = 36,
    frame_count = 19,
    line_length = 19,
    shift = {0.03125, 0.3125},
    tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
    animation_speed = 0.3,
  },
}

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
miningRobot.order = "a[robot]-a[mining-robot-1]"
miningRobot.subgroup = "mining-robots"
miningRobot.idle = miningrobot_idle(1)
miningRobot.in_motion = miningrobot_in_motion(1)
miningRobot.working = miningrobot_working(1)
miningRobot.shadow_idle = miningrobot_shadow
miningRobot.shadow_in_motion = miningrobot_shadow
miningRobot.shadow_working = miningrobot_shadow_working
miningRobot.smoke = miningrobot_smoke
miningRobot.sparks = miningrobot_sparks
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

if robotMiningSite.settings.botsmk == true then
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
      miningRobotMK2.order = "a[robot]-a[mining-robot-2]"
      miningRobotMK2.speed = 0.09
      miningRobotMK2.max_health = 225
      miningRobotMK2.idle = miningrobot_idle(2)
      miningRobotMK2.in_motion = miningrobot_in_motion(2)
      miningRobotMK2.working = miningrobot_working(2)

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

      local miningRobotMK3 = deepcopy(data.raw["construction-robot"]["mining-robot-2"])
      miningRobotMK3.name = "mining-robot-3"
      miningRobotMK3.icon = "__robotMiningSite__/graphics/icons/mining-robot-3.png"
      miningRobotMK3.idle.filename = "__robotMiningSite__/graphics/entity/mining-robot-3.png"
      miningRobotMK3.in_motion.filename = "__robotMiningSite__/graphics/entity/mining-robot-3.png"
      miningRobotMK3.working.filename = "__robotMiningSite__/graphics/entity/mining-robot-working-3.png"
      miningRobotMK3.max_energy = "6000kJ"
      miningRobotMK3.energy_per_tick = "150J"
      miningRobotMK3.energy_per_move = "15kJ"
      miningRobotMK3.minable.result = "mining-robot-3"
      miningRobotMK3.order = "a[robot]-a[mining-robot-3]"
      miningRobotMK3.speed = 0.12
      miningRobotMK3.max_health = 350
      miningRobotMK3.idle = miningrobot_idle(3)
      miningRobotMK3.in_motion = miningrobot_in_motion(3)
      miningRobotMK3.working = miningrobot_working(3)
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

      local miningRobotMK4 = deepcopy(data.raw["construction-robot"]["mining-robot-3"])
      miningRobotMK4.name = "mining-robot-4"
      miningRobotMK4.icon = "__robotMiningSite__/graphics/icons/mining-robot-4.png"
      miningRobotMK4.idle.filename = "__robotMiningSite__/graphics/entity/mining-robot-4.png"
      miningRobotMK4.in_motion.filename = "__robotMiningSite__/graphics/entity/mining-robot-4.png"
      miningRobotMK4.working.filename = "__robotMiningSite__/graphics/entity/mining-robot-working-4.png"
      miningRobotMK4.max_energy = "7500kJ"
      miningRobotMK4.energy_per_tick = "160J"
      miningRobotMK4.energy_per_move = "15kJ"
      miningRobotMK4.minable.result = "mining-robot-4"
      miningRobotMK4.order = "a[robot]-a[mining-robot-4]"
	  miningRobotMK4.speed = 0.15
      miningRobotMK4.max_health = 500
      miningRobotMK4.idle = miningrobot_idle(4)
      miningRobotMK4.in_motion = miningrobot_in_motion(4)
      miningRobotMK4.working = miningrobot_working(4)
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

      local miningRobotMK5 = deepcopy(data.raw["construction-robot"]["mining-robot-4"])
      miningRobotMK5.name = "mining-robot-5"
      miningRobotMK5.icon = "__robotMiningSite__/graphics/icons/mining-robot-5.png"
      miningRobotMK5.idle.filename = "__robotMiningSite__/graphics/entity/mining-robot-5.png"
      miningRobotMK5.in_motion.filename = "__robotMiningSite__/graphics/entity/mining-robot-5.png"
      miningRobotMK5.working.filename = "__robotMiningSite__/graphics/entity/mining-robot-working-5.png"
      miningRobotMK5.max_energy = "1500kJ"
      miningRobotMK4.energy_per_tick = "0J"
      miningRobotMK4.energy_per_move = "0J"
      miningRobotMK5.minable.result = "mining-robot-5"
      miningRobotMK5.order = "a[robot]-a[mining-robot-5]"
      miningRobotMK4.idle = miningrobot_idle(5)
      miningRobotMK4.in_motion = miningrobot_in_motion(5)
      miningRobotMK4.working = miningrobot_working(5)
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

-- Item
local item = deepcopy(data.raw["item"]["construction-robot"])
item.name = "mining-robot"
item.icon = "__robotMiningSite__/graphics/icons/mining-robot.png"
item.order = "a[robot]-a[mining-robot-1]"
item.subgroup = "mining-robots"
item.place_result = "mining-robot"
data:extend({item})

if robotMiningSite.settings.botsmk == true then
      local item = deepcopy(data.raw["item"]["mining-robot"])
      item.name = "mining-robot-2"
      item.icon = "__robotMiningSite__/graphics/icons/mining-robot-2.png"
      item.place_result = "mining-robot-2"
      item.order = "a[robot]-a[mining-robot-2]"
      data:extend({item})

      local item = deepcopy(data.raw["item"]["mining-robot"])
      item.name = "mining-robot-3"
      item.icon = "__robotMiningSite__/graphics/icons/mining-robot-3.png"
      item.place_result = "mining-robot-3"
      item.order = "a[robot]-a[mining-robot-3]"
      data:extend({item})

      local item = deepcopy(data.raw["item"]["mining-robot"])
      item.name = "mining-robot-4"
      item.icon = "__robotMiningSite__/graphics/icons/mining-robot-4.png"
      item.place_result = "mining-robot-4"
      item.order = "a[robot]-a[mining-robot-4]"
      data:extend({item})

      local item = deepcopy(data.raw["item"]["mining-robot"])
      item.name = "mining-robot-5"
      item.icon = "__robotMiningSite__/graphics/icons/mining-robot-5.png"
      item.place_result = "mining-robot-5"
      item.order = "a[robot]-a[mining-robot-5]"
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