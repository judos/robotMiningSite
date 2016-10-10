function migration_0_3_0()
	-- migrate data to new variables
	-- global.robotMiningSite.schedule -> global.schedule
	-- global.robotMiningSite.entityData -> global.entityData

	global.schedule = global.robotMiningSite.schedule
	global.entityData = global.robotMiningSite.entityData

	-- remove logistics decider, add circuit control and copy over condition
	for entityId,data in pairs(global.entityData) do
		local entity = entityOfId_v21(entityId,"robotMiningSite-")
		if entity and entity.valid and data.logisticsDecider.valid then
			local condition = data.logisticsDecider.get_circuit_condition(defines.circuitconditionindex.decider_combinator)

			local pos = {x = entity.position.x-1, y=entity.position.y+1}
			local control = entity.surface.create_entity({name="miningSite-control",position=pos,force=entity.force})
			control.minable = false
			control.destructible = false
			local pos = {x = entity.position.x-1, y=entity.position.y+1}
			local controlOverlay = entity.surface.create_entity({name="miningSite-control-overlay",position=pos,force=entity.force})
			control.connect_neighbour({wire=defines.circuitconnector.green,target_entity=controlOverlay})
			controlOverlay.set_circuit_condition(defines.circuitconditionindex.lamp,
				{condition={comparator="=",
					first_signal={type="item", name="iron-plate"},
					second_signal={type="item", name="iron-plate"}}
				})

			local pos = {x = entity.position.x, y=entity.position.y+1}
			local robotChest = entity.surface.create_entity({name="robot-chest",position=pos,force=entity.force})
			robotChest.minable = false
			robotChest.destructible = false
			
			local pos = {x = entity.position.x-0.5, y=entity.position.y+0.5}
			data.miningRoboport.teleport(pos)

			control.set_circuit_condition(defines.circuitconditionindex.lamp,condition)
			data.control = control
			data.controlOverlay = controlOverlay
			data.robotChest = robotChest
			data.logisticsDecider.destroy()
			data.logisticsDecider = nil
		else
			global.entityData[entityId] = nil
		end
	end

	global.robotMiningSite.schedule = nil
	global.robotMiningSite.entityData = nil
	
	entities_migration_V2()

	global.robotMiningSite.version = "0.3.0"
	PlayerPrint("RobotMiningSite migrated to 0.3.0")
end
