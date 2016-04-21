forceSuffix = "-miningRobots"

-- Fetch the special mining force for an entity
function miningForceFor(entity)
	local forceName = entity.force.name

	if not forceName:ends(forceSuffix) then
		forceName = forceName..forceSuffix
		if not game.forces[forceName] then
			game.create_force(forceName) 
			entity.force.set_cease_fire(forceName,true)
		end
	end
	
	return forceName
end
