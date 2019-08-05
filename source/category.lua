data:extend({
  {
    type = "item-subgroup",
    name = "mining-robots",
    group = "logistics",
    order = "g-b",
  },
  {
    type = "item-subgroup",
    name = "mining-roboport",
    group = "logistics",
    order = "g-c",
  }
})

if robotMiningSite.settings.bobs == true then
  data.raw["item-subgroup"]["mining-robots"].group = "bob-logistics"
  data.raw["item-subgroup"]["mining-robots"].order = "f-a3"
  data.raw["item-subgroup"]["mining-roboport"].group = "bob-logistics"
  data.raw["item-subgroup"]["mining-roboport"].order = "f-a4"
end