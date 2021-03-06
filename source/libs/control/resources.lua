-- parameters: resource entity
-- returns: table of SimpleItemStack with result which was mined (1 cycle of mining)
-- 					e.g. {{ name="iron-ore",1},{name="iron-nugget",1}}
function getMiningResultItems(resource)
	if not resource.valid then return {} end
	local products = resource.prototype.mineable_properties.products
	local resultStacks = {}
	local isInfinite = resource.prototype.infinite_resource
	local yield = resource.amount / resource.prototype.normal_resource_amount
				
	for _,itemDescription in pairs(products) do
		if itemDescription.type == "item" then
			local prob = itemDescription.probability or 1
			if isInfinite then
				prob = prob * yield
			end
			local randomValue = math.random()
			if randomValue<prob then
				local amount = math.random(itemDescription.amount_min or 1, itemDescription.amount_max or 1)
				table.insert(resultStacks,{name=itemDescription.name, count = amount})
			end
		end
	end
	
	if isInfinite and #resultStacks == 0 then
		table.insert(resultStacks,{name="fake-generated-item", count = 1})
	end
	
	return resultStacks
end


function mineResource(resource)
	if not resource.valid then return {} end
	local itemStacksGenerated = getMiningResultItems(resource)
	local isInfinite = resource.prototype.infinite_resource
	if resource.amount > 1 then
		if (not isInfinite) or (resource.amount > resource.prototype.minimum_resource_amount) then
			resource.amount = resource.amount - 1
		end
	else
		resource.destroy()
	end
	return itemStacksGenerated
end

