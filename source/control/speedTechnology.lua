function speedTechnologyInit()
	if global.robotMiningSite.speedResearch==nil then
		global.robotMiningSite.speedResearch = 0
	end
end

script.on_event(defines.events.on_research_finished,function(event)
	local research = event.research.name
	local force = event.research.force.name

	if string.find(research, "mining-robot-speed", 1, true) then
		global.robotMiningSite.speedResearch = global.robotMiningSite.speedResearch + 1
	end
	--game.print("researched "..research.."; level "..global.robotMiningSite.speedResearch)
	-- old API
	--[[if research.name == "mining-robot-speed-1" then
		global.robotMiningSite.speedResearch = 1
	elseif research.name == "mining-robot-speed-2" then
		global.robotMiningSite.speedResearch = 2
	elseif research.name == "mining-robot-speed-3" then
		global.robotMiningSite.speedResearch = 3
	elseif research.name == "mining-robot-speed-4" then
		global.robotMiningSite.speedResearch = 4
	elseif research.name == "mining-robot-speed-5" then
		global.robotMiningSite.speedResearch = event.research.level
	end]]
	updateMiningRobotSpeedForForce(force, global.robotMiningSite.speedResearch)
end)

function updateMiningRobotSpeedForForce(force, lvl) 
	local miningForceName = miningForceForForce(force)
	local miningForce = game.forces[miningForceName]
	local speed = miningForce.worker_robots_speed_modifier

	if lvl >= 1 and lvl < 6 then
		speed = speed + 0.40
	elseif lvl >= 6 then
		speed = speed + 0.25
	end
	--game.print("new speed "..speed)
	miningForce.worker_robots_speed_modifier = speed
end