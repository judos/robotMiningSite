forceSuffix = "-miningRobots"

-- Fetch the special mining force for an entity
function miningForceForEntity(entity)
	local forceName = entity.force.name
	return miningForceForForce(forceName)
end


function miningForceForForce(forceName)
	if type(forceName) ~= "string" then
		warn("Invalid forceName: "..tostring(forceName))
		forceName = forceName.name
	end
	if not forceName:ends(forceSuffix) then
		local miningForceName = forceName..forceSuffix
		if not game.forces[miningForceName] then
			game.create_force(miningForceName)
			game.forces[forceName].set_cease_fire(miningForceName,true)
		end
		return miningForceName
	end
	return forceName
end