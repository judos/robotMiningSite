data:extend({
	{
		type = "container",
		name = "robot-chest",
		max_health = 100,
		open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
		close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
		collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
		selection_box = {{-0.5, -0.8}, {0.5, 0.5}},
		inventory_size = 32,
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		picture = {
			filename = "__robotMiningSite__/graphics/empty.png",
			priority = "extra-high",
			width = 0,
			height = 0,
			shift = {0, 0}
		}
	},
	{
		type = "logistic-container",
		name = "robot-chest-provider",
		max_health = 150,
		collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
		selection_box = {{-0.5, -0.8}, {0.5, 0.5}},
		inventory_size = 48,
		logistic_mode = "passive-provider",
		open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
		close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		picture = {
			filename = "__robotMiningSite__/graphics/entity/robot-chest-provider.png",
			priority = "extra-high",
			width = 38,
			height = 32,
			shift = {0.1, 0}
		},
		circuit_wire_max_distance = 0,
		order = "zzz"
	},
	{
		type = "logistic-container",
		name = "robot-chest-requester",
		max_health = 150,
		collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
		selection_box = {{-0.5, -0.8}, {0.5, 0.5}},
		inventory_size = 48,
		logistic_slots_count = 12,
		logistic_mode = "requester",
		open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
		close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		picture = {
			filename = "__robotMiningSite__/graphics/entity/robot-chest-requester.png",
			priority = "extra-high",
			width = 38,
			height = 32,
			shift = {0.1, 0}
		},
		circuit_wire_max_distance = 0,
		order = "zzz"
	}
})
