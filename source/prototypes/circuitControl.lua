local control = deepcopy(data.raw.lamp["small-lamp"])
overwriteContent(control,{
	name = "miningSite-control",
	light = {intensity = 0, size = 0},
	icon = nil, --"__robotMiningSite__/graphics/icons/",
	energy_usage_per_tick = "0W",
	energy_usage = "0W",
	energy_source = {
		type = "electric",
		usage_priority = "secondary-output",
	},
	collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
	selection_box = {{-0.5, -0.8}, {0.5, 0.5}},
	order = "zzz",
	picture_off = {
		filename = "__robotMiningSite__/graphics/entity/circuitControl-off.png",
		priority = "high",
		width = 67,
		height = 58,
		frame_count = 1,
		axially_symmetrical = false,
		direction_count = 1,
		shift = {-0.021875, -0.2},
	},
	picture_on = {
		filename = "__robotMiningSite__/graphics/entity/circuitControl-on.png",
		priority = "high",
		width = 67,
		height = 58,
		frame_count = 1,
		axially_symmetrical = false,
		direction_count = 1,
		shift = {-0.021875, -0.2},
	},
})

data:extend({	control })


local controlOverlay = deepcopy(control)
controlOverlay.name = "miningSite-control-overlay"
controlOverlay.selection_box = nil
controlOverlay.picture_off.width = 0
controlOverlay.picture_off.height = 0
data:extend({ controlOverlay })
