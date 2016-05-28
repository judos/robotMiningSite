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
	order = "zzz"
})
control.picture_off.filename = "__robotMiningSite__/graphics/entity/circuitControl-off.png"
control.picture_on.filename = "__robotMiningSite__/graphics/entity/circuitControl-on.png"

data:extend({
	control
})