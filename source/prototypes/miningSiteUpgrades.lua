local upgrade1_ingredients = {}

if robotMiningSite.settings.easyT1 == true then
	upgrade1_ingredients = {
		{"robotMiningSite", 1},
		{"steel-plate", 40},
		{"advanced-circuit", 30},
		{"processing-unit", 20},
	}
else
	upgrade1_ingredients = {
		{"robotMiningSite", 1},
		{"steel-plate", 40},
		{"advanced-circuit", 30},
		{"processing-unit", 15},
	}
end

data:extend({
	{
		type = "recipe",
		name = "upgradeMiningSite1",
		enabled = "false",
		ingredients = upgrade1_ingredients,
		result = "robotMiningSite-large",
		energy_required = 10,
	},
	{
		type = "recipe",
		name = "upgradeMiningSite2",
		enabled = "false",
		ingredients = {
			{"robotMiningSite-large", 1},
			{"steel-plate", 60},
			{"advanced-circuit", 40},
			{"processing-unit", 20},
		},
		result = "robotMiningSite-extra",
		energy_required = 60
	},
	{
		type = "technology",
		name = "upgradeMiningSite",
		icon = "__robotMiningSite__/graphics/technology/mining-robotics.png",
    	icon_size = 64,
    	prerequisites = {"mining-robotics-large", "advanced-electronics-2"},
    	unit = {
    		count = 250,
    		ingredients = {
    			{"science-pack-1", 2},
    			{"science-pack-2", 2},
    			{"science-pack-3", 2},
    			{"production-science-pack", 2},
    		},
    		time = 30
    	},
    	order = "_mining3",
    },
})

addTechnologyUnlocksRecipe("upgradeMiningSite","upgradeMiningSite1")
addTechnologyUnlocksRecipe("upgradeMiningSite","upgradeMiningSite2")