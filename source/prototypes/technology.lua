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
