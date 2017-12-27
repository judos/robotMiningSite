require("prototypes.generatedItemSubgroup")

data:extend({
  {
    type = "item",
    name = "fake-generated-item",
    icon = "__robotMiningSite__/graphics/icons/fakeItem.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "generated",
    order = "zzz",
	icon_size = 32,
    stack_size = 10000,
  }
})
