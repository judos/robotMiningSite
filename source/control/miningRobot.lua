
entities["mining-robot"] = {
	build = function(entity)
		local forceName = miningForceForEntity(entity)
		entity.force = forceName
	end
}
