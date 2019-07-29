function migration_0_8_0()
	game.print("Start migration of Robot Mining Site to version 8.0.0")
	for index, force in pairs(game.forces) do
		local technologies = force.technologies
		local recipes = force.recipes
		if technologies["mining-robot-speed-3"].researched then 
			technologies["mining-robot-speed-4"].researched = true
			game.print("Mining robot speed 3 migrated")
		elseif technologies["mining-robot-speed-2"].researched then 
			technologies["mining-robot-speed-3"].researched = true
			game.print("Mining robot speed 2 migrated")
		elseif technologies["mining-robot-speed-1"].researched then
			game.print("Mining robot speed 1 migrated")
		end
	end

	--updateMiningRobotSpeedForForce(technologies)
	
	global.robotMiningSite.version = "0.8.0"
	game.print("RobotMiningSite migrated to 0.8.0")
end