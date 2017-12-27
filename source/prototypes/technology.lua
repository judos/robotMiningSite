require "libs.prototypes.technology"

data:extend({
  {
    type = "technology",
    name = "mining-robotics",
    icon = "__robotMiningSite__/graphics/technology/mining-robotics.png",
    icon_size = 32,
	prerequisites = {"construction-robotics"},
    unit = {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 3},
        {"science-pack-2", 1}
      },
      time = 20
    },
    order = "_mining",
  }
})

addTechnologyUnlocksRecipe("mining-robotics","robotMiningSite")
addTechnologyUnlocksRecipe("mining-robotics","mining-robot")

data:extend({
  {
    type = "technology",
    name = "mining-robotics-large",
    icon = "__robotMiningSite__/graphics/technology/mining-robotics.png",
    icon_size = 32,
	prerequisites = {"mining-robotics"},
    unit = {
      count = 200,
      ingredients =
      {
        {"science-pack-1", 3},
				{"science-pack-2", 2},
        {"science-pack-3", 1}
      },
      time = 20
    },
    order = "_mining2",
  }
})

addTechnologyUnlocksRecipe("mining-robotics-large","robotMiningSite-large")
addTechnologyUnlocksRecipe("mining-robotics-large","robotMiningSite-extra")

--Uranium piece
data:extend({
  {
    type = "technology",
	name = "uranium-rubble-processing",
	icon = "__robotMiningSite__/graphics/technology/uranium-rubble-processing.png",
	icon_size = 32,
	prerequisites = {"mining-robotics","nuclear-power"},
	icon_size = 64,
	effects =
    {
      {
        type = "unlock-recipe",
        recipe = "uranium-rubble-cleaning"
      }
	},
	unit = {
	  count = 100,
	  ingredients = {
	    {"science-pack-1", 1},
		{"science-pack-2", 1},
		{"science-pack-3", 1},
		{"high-tech-science-pack", 1}
	  },
	  time = 30
	},
	order = "_mining1",
  }
})
