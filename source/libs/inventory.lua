
function addContentsTables(content1,content2)
	local result = deepcopy(content1)
	for name,amount in pairs(content2) do
		if result[name] ~= nil then
			result[name] = result[name] + amount
		else
			result[name] = amount
		end
	end
	return result
end
