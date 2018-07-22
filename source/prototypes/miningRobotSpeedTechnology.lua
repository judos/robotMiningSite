data:extend({
	{
		type = "technology",
		name = "mining-robot-speed-1",
		icon = "__base__/graphics/technology/worker-robots-speed.png",
		icon_size = 128,
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

local speed2 = deepcopy(data.raw.technology["mining-robot-speed-1"])
overwriteContent(speed2,{
	name = "mining-robot-speed-2",
	prerequisites = { "mining-robot-speed-1" },
	unit = {
		count = 150,
		ingredients = {
			{"science-pack-1", 2},
			{"science-pack-2", 2},
			{"science-pack-3", 1},
		},
		time = 30
	}
})
data:extend({speed2})

local speed3 = deepcopy(data.raw.technology["mining-robot-speed-2"])
overwriteContent(speed3,{
	name = "mining-robot-speed-3",
	prerequisites = { "mining-robot-speed-2" },
	unit = {
		count = 200,
		ingredients = {},
		time = 30
	}
})
if data.raw.item["logistic-science-pack"] then
	speed3.unit.ingredients = {
		{"science-pack-1", 2},
		{"science-pack-2", 2},
		{"science-pack-3", 2},
		{"logistic-science-pack", 2}
	}
else
	speed3.unit.ingredients = {
		{"science-pack-1", 2},
		{"science-pack-2", 2},
		{"science-pack-3", 2},
		{"production-science-pack", 2}
	}
end
data:extend({speed3})

local speed4 = deepcopy(data.raw.technology["mining-robot-speed-3"])
overwriteContent(speed4,{
	name = "mining-robot-speed-4",
	prerequisites = { "mining-robot-speed-3" },
	unit = {
		count = 250,
		ingredients = {},
		time = 30
	}
})
if data.raw.item["logistic-science-pack"] then
	speed4.unit.ingredients = {
		{"science-pack-1", 2},
		{"science-pack-2", 2},
		{"science-pack-3", 2},
		{"logistic-science-pack", 2},
		{"high-tech-science-pack", 1}
	}
else
	speed4.unit.ingredients = {
		{"science-pack-1", 2},
		{"science-pack-2", 2},
		{"science-pack-3", 2},
		{"production-science-pack", 2},
		{"high-tech-science-pack", 1}
	}
end
data:extend({speed4})


if data.raw.item["logistic-science-pack"] then
	speed5_ingredients = {
		{"science-pack-1", 2},
		{"science-pack-2", 2},
		{"science-pack-3", 2},
		{"logistic-science-pack", 2},
		{"high-tech-science-pack", 2},
		{"space-science-pack", 1}
	}
else
	speed5_ingredients = {
		{"science-pack-1", 2},
		{"science-pack-2", 2},
		{"science-pack-3", 2},
		{"production-science-pack", 2},
		{"high-tech-science-pack", 2},
		{"space-science-pack", 1}
	}
end

data:extend({
	{
		type = "technology",
		name = "mining-robot-speed-5",
		icon = "__base__/graphics/technology/worker-robots-speed.png",
		icon_size = 128,
		effects = {},
		prerequisites = {"mining-robot-speed-4"},
		unit = {
			count_formula = "200+(50*2^L)",
			ingredients = speed5_ingredients,
			time = 30
		},
		max_level = "infinite",
		upgrade = true,
		order = "_mining1"
	}
})
