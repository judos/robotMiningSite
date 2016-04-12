require "sharedCode.functions"

data:extend({
 {
    type = "container",
    name = "robotMiningSite",
    icon = "__robotMiningSite__/graphics/icons/robotMiningSite.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 2, result = "robotMiningSite"},
		max_health = 300,
		corpse = "small-remnants",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		inventory_size = 0,
    open_sound = { filename = "__base__/sound/wooden-chest-open.ogg" },
    close_sound = { filename = "__base__/sound/wooden-chest-close.ogg" },
    vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
    picture =
    {
      filename = "__robotMiningSite__/graphics/entity/robotMiningSite-area.png",
			priority = "extra-high",
      width = 672,
			height = 672,
			shift = {0, 0},
    },
		order = "c[signal]-b[robotMiningSiteArea]"
  },
})
