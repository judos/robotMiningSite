-- logistic decider without wire connections
local e = deepcopy(data.raw["decider-combinator"]["decider-combinator"])

e.name = "logistic-decider-combinator"
e.circuit_wire_max_distance = 0
e.order = "zzz"
e.sprites.north.filename = "__robotMiningSite__/graphics/entity/logistics-decider.png"
e.sprites.west.filename = "__robotMiningSite__/graphics/entity/logistics-decider.png"
e.sprites.east.filename = "__robotMiningSite__/graphics/entity/logistics-decider.png"
e.sprites.south.filename = "__robotMiningSite__/graphics/entity/logistics-decider.png"

overwriteContent(e,{
	input_connection_points = {
		{ shadow = {}, wire = {} },
		{ shadow = {}, wire = {} },
		{ shadow = {}, wire = {} },
		{ shadow = {}, wire = {} }
	},
	output_connection_points = {
		{ shadow = {}, wire = {} },
		{ shadow = {}, wire = {} },
		{ shadow = {}, wire = {} },
		{ shadow = {}, wire = {} }
	}
})

data:extend({e})