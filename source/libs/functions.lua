require "libs.logging"
require "libs.basic-lua-extensions"
require "libs.resources"

-- adds a recipe which is unlocked when the given technology is researched
function addTechnologyUnlocksRecipe(technologyName, recipeName)
	local tech = data.raw["technology"][technologyName]
	if tech then
		if not tech.effects then
			tech.effects = {}
		end
		table.insert(tech.effects, {type = "unlock-recipe", recipe = recipeName })
	else
		error("Technology "..technologyName.." not found. Did you mean?")
		for name,_ in pairs(data.raw["technology"]) do
			error(" "..name)
		end
	end
end

function overwriteContent(originalTable,newContent)
	for k,d in pairs(newContent) do
		originalTable[k]=d
	end
end