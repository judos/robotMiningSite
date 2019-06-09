-- invisible storage chest
local e = deepcopy(data.raw["logistic-container"]["logistic-chest-storage"])

e.name = "invisible-logistic-chest-storage"
e.order = "zzz"
--[[e.animation.layers = {
	height = 1,
	with = 1,
	hr_version = {
		heigth = 1,
		width = 1
	}
	}]]
e.selection_box = nil
e.next_upgrade = nil
table.insert(e.flags,"placeable-off-grid")

data:extend({e})