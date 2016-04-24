game.reload_script()

for i, force in pairs(game.forces) do
	force.reset_technologies()
	force.reset_recipes()
	
	-- technology unlocking migration:
	force.recipes["robotMiningSite"].enabled = force.technologies["mining-robotics"].researched
end
