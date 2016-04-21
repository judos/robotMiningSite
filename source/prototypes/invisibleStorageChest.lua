-- invisible storage chest
local e = deepcopy(data.raw["logistic-container"]["logistic-chest-storage"])

e.name = "invisible-logistic-chest-storage"
e.order = "zzz"
e.picture.width = 0
e.picture.height = 0
e.selection_box = nil
table.insert(e.flags,"placeable-off-grid")

data:extend({e})