data:extend({
	{
		type = "technology",
		name = "mining-robot-speed-1x",
		icon = "__base__/graphics/technology/worker-robots-speed.png",
		effects = {},
		prerequisites = {
			"mining-robotics"
		},
		unit = {
			count = 100,
			ingredients = {
				{"science-pack-1", 2},
				{"science-pack-2", 1},
			},
			time = 30
		},
		upgrade = true,
		order = "_mining1"
	}
})

local speed2 = deepcopy(data.raw.technology["mining-robot-speed-1x"])
overwriteContent(speed2,{
	name = "mining-robot-speed-2x",
	prerequisites = { "mining-robot-speed-1x" },
	unit = {
		count = 100,
		ingredients = {
			{"science-pack-1", 3},
			{"science-pack-2", 2},
			{"science-pack-3", 1},
		},
		time = 30
	}
})
data:extend({speed2})

local speed3 = deepcopy(data.raw.technology["mining-robot-speed-2x"])
overwriteContent(speed3,{
	name = "mining-robot-speed-3x",
	prerequisites = { "mining-robot-speed-2x" },
	unit = {
		count = 200,
		ingredients = {
			{"science-pack-1", 3},
			{"science-pack-2", 2},
			{"science-pack-3", 1},
		},
		time = 30
	}
})
data:extend({speed3})
