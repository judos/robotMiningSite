
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
			stack.count = invTarget.insert(stack)
			stack.count = invSource.remove(stack)
		else
			return false -- couldn't move all, target chest is full
		end
		if stack.count ~= count then return false end
	end
	return true
end

function killItemsInInventor(inventory, itemName)
	inventory.remove({name=itemName,count=1000000})
end


function spillInventory(inventory, surface, position)
	for i=1,#inventory do
		local stack = inventory[i]
		if stack and stack.valid and stack.valid_for_read then
			surface.spill_item_stack(position,stack)
		end
	end
end