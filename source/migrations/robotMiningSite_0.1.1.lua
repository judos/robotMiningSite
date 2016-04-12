for i, force in pairs(game.forces) do
	force.reset_technologies()
	force.reset_recipes()
	
	-- technology unlocking migration:
	if force.technologies["construction-robotics"].researched then
		force.recipes["robotMiningSite"].enabled = true
	end
end