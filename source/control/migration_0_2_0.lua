function migration_0_2_0()
	-- migrate data to new variables
	-- basically impossible since new robot mining site requires more space -> destroy all of them and spills them on the floor
	
	-- old: global.robotMiningSite.schedule[tick] = { entity, ... }
	-- new: global.robotMiningSite.schedule[tick][idEntity] = $ENTITY$
	
	if not global.robotMiningSite.entityData then global.robotMiningSite.entityData = {} end
	for tick,array in pairs(global.robotMiningSite.schedule) do
		warn(array)
		for _,entity in pairs(array) do
			removeOldEntityAndPlaceDown(entity)
		end
	end
	global.robotMiningSite.schedule = {}
	global.robotMiningSite.version = "0.2.0"
	
	scheduleText(60,"Migrated to robotMiningSite 0.2.0")
	scheduleText(90,"Mining sites removed and placed as items on the floor. Please rebuild them")
end

function removeOldEntityAndPlaceDown(entity)
	if entity.valid then
		local pos = entity.position
		local surface = entity.surface
		PlayerPrint("Old mining site at: "..math.ceil(entity.position.x).." | "..math.ceil(entity.position.y).." placed down as item")
		entity.destroy()
		surface.spill_item_stack(pos,{name="robotMiningSite",count=1})
	end
end

function scheduleText(inTicks,text)
	global.robotMiningSite.schedule[game.tick+inTicks]={}
	global.robotMiningSite.schedule[game.tick+inTicks]["text"]=text
end