local function robotSpeedUpgrade(lvl)
	
	if lvl < 5 then
		return {
			type = "nothing",
			effect_description = {"modifier-description.mining-robot-speed", tostring(40)},	
		}
	else
		return {
			type = "nothing",
			effect_description = {"modifier-description.mining-robot-speed", tostring(25)},	
		}
	end
end

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
				{"automation-science-pack", 2},
				{"logistic-science-pack", 1},
			},
			time = 30
		},
		effects = {robotSpeedUpgrade(1)},
		upgrade = true,
		order = "_mining1"
	}
})

local speed2 = deepcopy(data.raw.technology["mining-robot-speed-1"])
overwriteContent(speed2,{
	name = "mining-robot-speed-2",
	prerequisites = { "mining-robot-speed-1" },
	effects = {robotSpeedUpgrade(2)},
	unit = {
		count = 150,
		ingredients = {
			{"automation-science-pack", 2},
			{"logistic-science-pack", 2},
			{"production-science-pack", 1},
		},
		time = 30
	}
})
data:extend({speed2})

local speed3 = deepcopy(data.raw.technology["mining-robot-speed-2"])
overwriteContent(speed3,{
	name = "mining-robot-speed-3",
	prerequisites = { "mining-robot-speed-2" },
	effects = {robotSpeedUpgrade(3)},
	unit = {
		count = 200,
		ingredients = {},
		time = 30
	}
})
speed3.unit.ingredients = {
	{"automation-science-pack", 2},
	{"logistic-science-pack", 3},
	{"production-science-pack", 2},
	{"chemical-science-pack", 1}
}
data:extend({speed3})

local speed4 = deepcopy(data.raw.technology["mining-robot-speed-3"])
overwriteContent(speed4,{
	name = "mining-robot-speed-4",
	prerequisites = { "mining-robot-speed-3" },
	effects = {robotSpeedUpgrade(4)},
	unit = {
		count = 250,
		ingredients = {},
		time = 30
	}
})

speed4.unit.ingredients = {
	{"automation-science-pack", 2},
	{"logistic-science-pack", 4},
	{"production-science-pack", 3},
	{"chemical-science-pack", 2}
}
data:extend({speed4})


speed5_ingredients = {
	{"automation-science-pack", 3},
	{"logistic-science-pack", 4},
	{"production-science-pack", 3},
	{"chemical-science-pack", 3},
	{"utility-science-pack", 2}
}

data:extend({
	{
		type = "technology",
		name = "mining-robot-speed-5",
		icon = "__base__/graphics/technology/worker-robots-speed.png",
		icon_size = 128,
	    effects = {robotSpeedUpgrade(5)},
		prerequisites = {"mining-robot-speed-4"},
		unit = {
			count_formula = "200+(50*2^(L-4))",
			ingredients = speed5_ingredients,
			time = 30
		},
		max_level = "infinite",
		upgrade = true,
		order = "_mining1"
	}
})
