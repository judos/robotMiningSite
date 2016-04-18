require "libs.logging"
require "libs.basic-lua-extensions"

-- adds a recipe which is unlocked when the given technology is researched
function addTechnologyUnlocksRecipe(technologyName, recipeName)
	if data.raw["technology"][technologyName] then
		table.insert(data.raw["technology"][technologyName].effects,
			{ type = "unlock-recipe", recipe = recipeName })
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