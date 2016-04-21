-- parameters: resource entity
-- returns: table of SimpleItemStack with result which was mined (1 cycle of mining)
-- 					e.g. {{ name="iron-ore",1},{name="iron-nugget",1}}
function getMiningResult(resource)
	local products = resource.prototype.mineable_properties.products
	local resultStacks = {}
	for _,itemDescription in pairs(products) do
		local prob = itemDescription.probability
		local randomValue = math.random()
		if randomValue<prob then
			local amount = math.random(itemDescription.amount_min, itemDescription.amount_max)
			table.insert(resultStacks,{name=itemDescription.name, count = amount})
		end
	end
	return resultStacks
end