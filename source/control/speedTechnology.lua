function speedTechnologyInit()
	if global.robotMiningSite.speedResearch==nil then
		global.robotMiningSite.speedResearch = 0
	end
end

script.on_event(defines.events.on_research_finished,function(event)
	local research = event.research
	if research.name == "mining-robot-speed-1x" then
		global.robotMiningSite.speedResearch = 1
	elseif research.name == "mining-robot-speed-2x" then
		global.robotMiningSite.speedResearch = 2
	elseif research.name == "mining-robot-speed-3x" then
		global.robotMiningSite.speedResearch = 3
	end
	updateMiningRobotSpeedForForce(research.force)
end)

function updateMiningRobotSpeedForForce(force) 
	local miningForceName = miningForceForForce(force.name)
	local miningForce = game.forces[miningForceName]
	local speed = 0
	if global.robotMiningSite.speedResearch == 1 then
		speed = 0.4
	elseif global.robotMiningSite.speedResearch == 2 then
		speed = 0.8
	elseif global.robotMiningSite.speedResearch == 3 then
		speed = 1.2
	end
	miningForce.worker_robots_speed_modifier = speed
end