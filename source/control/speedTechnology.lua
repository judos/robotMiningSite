function speedTechnologyInit()
	if global.robotMiningSite.speedResearch==nil then
		global.robotMiningSite.speedResearch = 0
	end
end

script.on_event(defines.events.on_research_finished,function(event)
	local research = event.research
	if research.name == "mining-robot-speed-1" then
		global.robotMiningSite.speedResearch = 1
	elseif research.name == "mining-robot-speed-2" then
		global.robotMiningSite.speedResearch = 2
	elseif research.name == "mining-robot-speed-3" then
		global.robotMiningSite.speedResearch = 3
	elseif research.name == "mining-robot-speed-4" then
		global.robotMiningSite.speedResearch = 4
	elseif research.name == "mining-robot-speed-5" then
		global.robotMiningSite.speedResearch = event.research.level
	end
	updateMiningRobotSpeedForForce(research.force)
end)

function updateMiningRobotSpeedForForce(force) 
	local miningForceName = miningForceForForce(force.name)
	local miningForce = game.forces[miningForceName]
	local speed = miningForce.worker_robots_speed_modifier
	local lvl = global.robotMiningSite.speedResearch

	if lvl >= 1 and lvl < 5 then
		speed = speed * (1 + (0.25 * lvl))
	elseif lvl >= 5 then
		speed = speed * (2 + (0.15 * (lvl - 4)))
	end
	
	miningForce.worker_robots_speed_modifier = speed
end
