
function migration_0_2_3()
	-- migrate data to new variables
	-- Entities are invalid since type has changed -> search them and replace again in schedule

	-- Current relevant data:
	-- global.robotMiningSite.schedule[tick][idEntity] = $entity
	-- global.robotMiningSite.entityData[idEntity] = { name=$name, ... }

	info(serpent.block(global.robotMiningSite.schedule))
	for tick,arr in pairs(global.robotMiningSite.schedule) do
		for idEntity,entity in pairs(arr) do
			if not entity.valid then
				local data = global.robotMiningSite.entityData[idEntity]
				local entity = entityOfId(idEntity,data.name)
				if entity then
					arr[idEntity] = entity
					local chestInv = data.providerChest.get_inventory(defines.inventory.chest)
					local entityInv = entity.get_inventory(defines.inventory.chest)
					if not moveInventoryToInventory(chestInv,entityInv) then
						spillInventory(chestInv,entity.surface,entity.position)
					end
					data.providerChest.destroy()
					data.providerChest = nil
				end
			end
		end
	end
	global.robotMiningSite.version = "0.2.3"
end
