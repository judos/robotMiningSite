
entities["mining-robot"] = {
	build = function(entity)
		local forceName = miningForceForEntity(entity)
		local newRobot = entity.surface.create_entity({name=entity.name,position=entity.position,force = forceName})
		entity.destroy()
	end
}
