
-- Item
data:extend({
	{
		type = "item",
		name = "robotMiningSite",
		icon = "__robotMiningSite__/graphics/icons/robotMiningSite.png",
		place_result = "robotMiningSite-new",
		flags = {"goes-to-quickbar"},
    subgroup = "logistic-network",
    order = "c[signal]-b[robotMiningSite]",
		category = "crafting",
		stack_size = 50,
	},
})

-- Recipe
data:extend({
  {
    type = "recipe",
    name = "robotMiningSite",
    enabled = "false",
    ingredients = {
      {"steel-plate", 20},
      {"advanced-circuit", 10},
      {"processing-unit", 5},
    },
    result = "robotMiningSite",
    energy_required = 1,
  },
})

-- Entity
data:extend({
 {
    type = "logistic-container",
    name = "robotMiningSite-new",
    icon = "__robotMiningSite__/graphics/icons/robotMiningSite.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 2, result = "robotMiningSite"},
		max_health = 300,
		corpse = "small-remnants",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
		selection_box = {{-1.4, 0.6}, {0.4, 1.4}},
		inventory_size = 60,
		logistic_mode = "passive-provider",
    vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
    picture = {
      filename = "__robotMiningSite__/graphics/entity/robotMiningSite1-chest.png",
			priority = "extra-high",
			width = 150,
			height = 132,
			shift = {0.85, 0}
    },
		order = "c[signal]-b[robotMiningSiteArea]",
		circuit_wire_max_distance = 7.5
  },
})
