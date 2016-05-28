updateEveryTicks = 20 -- the next update is triggered X ticks later
updateEveryTicksWaiting = 300 -- no logistics network nearby or no robots available

miningRange = 5
miningRangeLarge = 10
miningRangeExtra = 20


--prevent robots going to different mining site when low on energy:
miningSiteMinimalEnergy = 4/5 -- stop mining if roboport has less energy (percentage)
capacityRoboport = 100
capacityRoboportLarge = 400
capacityRoboportExtra = 1000