
function idOfEntity(entity)
	return string.format("%g_%g", entity.position.x, entity.position.y)
end
function entityOfId(id)
	local position = split(id,"_")
	local point = {tonumber(position[1]),tonumber(position[2])}
	local entities = game.surfaces.nauvis.find_entities{point,point}
	if entities == nil then return nil end
	if #entities == 0 then return nil end
	return entities[1]
end


function moveInventoryToInventory(invSource,invTarget)
	for itemName,count in pairs(invSource.get_contents()) do
		local stack = {name=itemName,count=count}
		if invTarget.can_insert(stack) then
			stack.count = invSource.remove(stack)
			invTarget.insert(stack)
		else
			warn("finished checking, no space left")
			return false -- couldn't move all, target chest is full
		end
	end
	warn("finished checking")
	return true
end


function spillInventory(inventory, surface, position)
	for i=1,#invSource do
		local stack = invSource[i]
		if stack and stack.valid and stack.valid_for_read then
			surface.spill_item_stack(position,stack)
		end
	end
end