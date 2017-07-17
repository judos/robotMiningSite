require "libs.prototypes.technology"

data:extend({
  {
    type = "technology",
    name = "mining-robotics",
    icon = "__robotMiningSite__/graphics/technology/mining-robotics.png",
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