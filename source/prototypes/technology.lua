require "libs.prototypes.technology"

data:extend({
  {
    type = "technology",
    name = "mining-robotics",
    icon = "__robotMiningSite__/graphics/technology/mining-robotics.png",
    icon_size = 64,
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
    icon_size = 64,
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

-- Upgraded bots
if robotMiningSite.settings.botsmk == true and robotMiningSite.settings.bobs == true then

data:extend({
  {
    type = "technology",
    name = "mining-robotics-2",
    icon = "__robotMiningSite__/graphics/technology/mining-robotics.png",
    icon_size = 64,
    effects =
    {
      {
      type = "unlock-recipe",
      recipe = "mining-robot-2"
      }
    },
    prerequisites = {"mining-robotics","bob-robots-1"},
    unit = {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 2},
        {"science-pack-3", 2}
      },
      time = 25
    },
    order = "_mining3",
  },
  {
    type = "technology",
    name = "mining-robotics-3",
    icon = "__robotMiningSite__/graphics/technology/mining-robotics.png",
    icon_size = 64,
    effects =
    {
      {
      type = "unlock-recipe",
      recipe = "mining-robot-3"
      }
    },
    prerequisites = {"mining-robotics-2","bob-robots-2"},
    unit = {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 2},
        {"science-pack-3", 2},
        {"production-science-pack", 2}
      },
      time = 30
    },
    order = "_mining4",
  },
  {
    type = "technology",
    name = "mining-robotics-4",
    icon = "__robotMiningSite__/graphics/technology/mining-robotics.png",
    icon_size = 64,
    effects =
    {
      {
      type = "unlock-recipe",
      recipe = "mining-robot-4"
      }
    },
    prerequisites = {"mining-robotics-3","bob-robots-3"},
    unit = {
      count = 100,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 2},
        {"science-pack-3", 2},
        {"production-science-pack", 2},
        {"high-tech-science-pack", 2}
      },
      time = 35
    },
    order = "_mining5",
  },
  {
    type = "technology",
    name = "mining-robotics-5",
    icon = "__robotMiningSite__/graphics/technology/mining-robotics.png",
    icon_size = 64,
    effects =
    {
      {
      type = "unlock-recipe",
      recipe = "mining-robot-5"
      }
    },
    prerequisites = {"mining-robotics-4","bob-robots-4"},
    unit = {
      count = 150,
      ingredients =
      {
        {"science-pack-1", 2},
        {"science-pack-2", 2},
        {"science-pack-3", 2},
        {"production-science-pack", 2},
        {"high-tech-science-pack", 2},
      },
      time = 40
    },
    order = "_mining6",
  },

})
end