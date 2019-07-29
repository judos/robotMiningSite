function migration_0_4_1()
	
	global.schedule = global.robotMiningSite.schedule
	global.robotMiningSite.schedule = nil
	
	global.entityData = global.robotMiningSite.entityData
	global.robotMiningSite.entityData = nil
	
	entities_init()
	
	global.robotMiningSite.version = "0.4.1"
	game.print("RobotMiningSite migrated to 0.4.1")
end