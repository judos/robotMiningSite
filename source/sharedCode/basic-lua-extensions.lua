function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

function split(s, delimiter)
    result = {}
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match)
    end
    return result
end

function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

---------------------------------------------------
-- Debug Functions
---------------------------------------------------

function debug(message)
	if debug_master then
		if type(message) ~= "string" then
			message = serpent.block(message)
		end
		print(message)
	end
end

function playerPrint(message)
	if not game then
		debug(message)
		return
	end
	for _,player in pairs(game.players) do
		player.print(message)
	end
end