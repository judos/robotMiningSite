
function miningRobotWasBuilt(entity)
	local forceName = miningForceFor(entity)
	local newRobot = entity.surface.create_entity({name=entity.name,position=entity.position,force = forceName})
	entity.destroy()
end