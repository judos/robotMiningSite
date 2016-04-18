forceSuffix = "-miningRobots"

-- Fetch the special mining force for an entity
function miningForceFor(entity)
	local forceName = entity.force.name
	if not type(forceName) == "string" then
		forceName = entity.force.name
	end
	if not forceName:ends(forceSuffix) then
		forceName = forceName..forceSuffix
		if not game.forces[forceName] then game.create_force(forceName) end
	end
	
	return forceName
end
