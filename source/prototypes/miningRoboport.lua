require "config"

local miningRoboport = deepcopy(data.raw.roboport.roboport)
local chargeEnergyMW = 1
local energyUsage = 50
local inputFlowMW = 2

overwriteContent(miningRoboport,{
	name = "mining-roboport",

	charging_energy = chargeEnergyMW.."MW",
	energy_usage = energyUsage.."kW",
	energy_source =
	{
		type = "electric",
		usage_priority = "secondary-input",
		input_flow_limit = inputFlowMW.."MW",
		buffer_capacity = "48MJ"
	},
	logistics_radius = miningRange-2,
	construction_radius = miningRange,
	material_slots_count = 0,
	robot_slots_count = 5,
	collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
	selection_box = {{-1, -1}, {1, 1}},
	order = "zzz",
	charging_offsets = {
		{-0.75, -0.25}, {0.75, -0.25}, {0.75, 0.75}, {-0.75, 0.75},
	},
	construction_radius_visualisation_picture = {
		filename = "__robotMiningSite__/graphics/entity/mining-roboport/roboport-construction-radius-visualization.png",
		width = 12,
		height = 12,
		priority = "extra-high-no-scale"
	},
	radius_visualisation_picture = {
		filename = "__robotMiningSite__/graphics/entity/mining-roboport/roboport-construction-radius-visualization.png",
		width = 12,
		height = 12,
		priority = "extra-high-no-scale"
	},
	base = {
		filename = "__robotMiningSite__/graphics/entity/mining-roboport/roboport-base.png",
		width = 72,
		height = 68,
		shift = {0.25, 0.125}
	},
	base_patch = {
		filename = "__robotMiningSite__/graphics/entity/mining-roboport/roboport-base-patch.png",
		priority = "medium",
		width = 35,
		height = 25,
		frame_count = 1,
		shift = {0.015625, 0.1015625}
	},
	base_animation = {
		filename = "__robotMiningSite__/graphics/entity/mining-roboport/roboport-base-animation.png",
		priority = "medium",
		width = 21,
		height = 16,
		frame_count = 8,
		animation_speed = 0.5,
		shift = {-0.26575, -0.96875}
	},
	door_animation_up = {
		filename = "__robotMiningSite__/graphics/entity/mining-roboport/roboport-door-up.png",
		priority = "medium",
		width = 26,
		height = 10,
		frame_count = 16,
		shift = {0.0078125, -0.4453125}
	},
	door_animation_down = {
		filename = "__robotMiningSite__/graphics/entity/mining-roboport/roboport-door-down.png",
		priority = "medium",
		width = 26,
		height = 11,
		frame_count = 16,
		shift = {0.0078125, -0.1171875}
	},
	recharging_animation = {
		filename = "__robotMiningSite__/graphics/entity/mining-roboport/roboport-recharging.png",
		priority = "high",
		width = 18,
		height = 18,
		frame_count = 16,
		scale = 1.5,
		animation_speed = 0.5
	}
})

data:extend({miningRoboport})


local largeRoboport = deepcopy(data.raw.roboport["mining-roboport"])
overwriteContent(largeRoboport, {
	name = "mining-roboport-large",
	charging_energy = (chargeEnergyMW*2).."MW",
	energy_usage = (energyUsage*2).."kW",
	charge_approach_distance = 3,
	robot_slots_count = 10,
	logistics_radius = miningRangeLarge - 2,
	construction_radius = miningRangeLarge
})
largeRoboport.energy_source.input_flow_limit = (inputFlowMW*4).."MW"
for _,v in pairs(miningRoboport.charging_offsets) do
	table.insert(largeRoboport.charging_offsets,v)
end
data:extend({largeRoboport})

local extraRoboport = deepcopy(data.raw.roboport["mining-roboport-large"])
overwriteContent(extraRoboport, {
	name = "mining-roboport-extra",
	charging_energy = (chargeEnergyMW*4).."MW",
	energy_usage = (energyUsage*4).."kW",
	charge_approach_distance = 2,
	robot_slots_count = 20,
	logistics_radius = miningRangeExtra - 2,
	construction_radius = miningRangeExtra,
})
extraRoboport.energy_source.input_flow_limit = (inputFlowMW*16).."MW"
for _,v in pairs(largeRoboport.charging_offsets) do
	table.insert(extraRoboport.charging_offsets,v)
end
data:extend({extraRoboport})
