function migration_0_3_0()
	-- migrate data to new variables
	-- global.robotMiningSite.schedule -> global.schedule
	-- global.robotMiningSite.entityData -> global.entityData

	global.schedule = global.robotMiningSite.schedule
	global.entityData = global.robotMiningSite.entityData
	
	-- remove logistics decider, add circuit control and copy over condition
	for entityId,data in pairs(global.entityData) do
		local entity = entityOfId(entityId,"robotMiningSite-")
		if entity and entity.valid and data.logisticsDecider.valid then
			local condition = data.logisticsDecider.get_circuit_condition(defines.circuitconditionindex.decider_combinator)
			
			local pos = {x = entity.position.x+1, y=entity.position.y-1}
			local control = entity.surface.create_entity({name="miningSite-control",position=pos,force=entity.force})
			control.minable = false
			control.destructible = false
			
			control.set_circuit_condition(defines.circuitconditionindex.lamp,condition)
			data.control = control
			data.logisticsDecider.destroy()
			data.logisticsDecider = nil
		else
			global.entityData[entityId] = nil
		end
	end
	
	global.robotMiningSite.version = "0.3.0"
	PlayerPrint("RobotMiningSite migrated to 0.3.0")
end
