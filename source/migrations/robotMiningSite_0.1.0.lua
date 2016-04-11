for i, force in pairs(game.forces) do
	force.reset_technologies()
	force.reset_recipes()
	
	-- technology unlocking migration:
	if force.technologies["rocket-silo"].researched then
		force.recipes["rocketAutoStarter"].enabled = true
	end
end