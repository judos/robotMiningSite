game.reload_script()

for index, force in pairs(game.forces) do

	if force.technologies["rubble-processing"].researched then 
		force.recipes["thorium-rubble-cleaning"].enabled = true
	end

end