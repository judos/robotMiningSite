-- Items
local largeItem = deepcopy(data.raw.item.robotMiningSite)
overwriteContent(largeItem, {
	name = "robotMiningSite-large",
	icon = "__robotMiningSite__/graphics/icons/robotMiningSite-large.png",
	place_result = "robotMiningSite-large",
	order = "c[signal]-b[robotMiningSite]2"
})
data:extend({largeItem})

local extraItem = deepcopy(data.raw.item.robotMiningSite)
overwriteContent(extraItem, {
	name = "robotMiningSite-extra",
	icon = "__robotMiningSite__/graphics/icons/robotMiningSite-extra.png",
	place_result = "robotMiningSite-extra",
	order = "c[signal]-b[robotMiningSite]3"
})
data:extend({extraItem})

-- Recipes
data:extend({
  {
    type = "recipe",
    name = "robotMiningSite-large",
    enabled = "false",
    ingredients = {
      {"steel-plate", 60},
      {"advanced-circuit", 40},
      {"processing-unit", 20},
    },
    result = "robotMiningSite-large",
    energy_required = 10,
  },
  {
    type = "recipe",
    name = "robotMiningSite-extra",
    enabled = "false",
    ingredients = {
      {"steel-plate", 120},
      {"advanced-circuit", 80},
      {"processing-unit", 40},
    },
    result = "robotMiningSite-extra",
    energy_required = 60,
  },
})

-- Entities
local largeEntity = deepcopy(data.raw["logistic-container"]["robotMiningSite-new"])
overwriteContent(largeEntity, {
	name = "robotMiningSite-large",
	icon = largeItem.icon,
	order = "c[signal]-b[robotMiningSiteArea-1]"
})
largeEntity.minable.result = "robotMiningSite-large"
largeEntity.picture.filename = "__robotMiningSite__/graphics/entity/mining-site/robotMiningSite-large.png"
data:extend({largeEntity})

local extraEntity = deepcopy(data.raw["logistic-container"]["robotMiningSite-new"])
overwriteContent(extraEntity, {
	name = "robotMiningSite-extra",
	icon = extraItem.icon,
	order = "c[signal]-b[robotMiningSiteArea-1]"
})
extraEntity.minable.result = "robotMiningSite-extra"
extraEntity.picture.filename = "__robotMiningSite__/graphics/entity/mining-site/robotMiningSite-extra.png"

data:extend({extraEntity})