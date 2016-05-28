local control = deepcopy(data.raw.lamp["small-lamp"])
overwriteContent(control,{
	name = "miningSite-control",
	light = {intensity = 0, size = 0},
	icon = nil, --"__robotMiningSite__/graphics/icons/",
	energy_usage_per_tick = "-1KW",
	energy_source = {
		type = "electric",
		usage_priority = "secondary-output"
	},
	order = "zzz",
	picture_off = {
		filename = "__robotMiningSite__/graphics/entity/circuitControl-off.png",
		priority = "high",
		width = 67,
		height = 58,
		frame_count = 1,
		axially_symmetrical = false,
		direction_count = 1,
		shift = {-0.021875, 0.16875},
	},
	picture_on = {
		filename = "__robotMiningSite__/graphics/entity/circuitControl-on.png",
		priority = "high",
		width = 67,
		height = 58,
		frame_count = 1,
		axially_symmetrical = false,
		direction_count = 1,
		shift = {-0.021875, 0.16875},
	},
})

data:extend({
	control
})