function migration_0_3_0()
	-- migrate data to new variables
	-- global.robotMiningSite.schedule -> global.schedule
	-- global.robotMiningSite.entityData -> global.entityData

	global.schedule = global.robotMiningSite.schedule
	global.entityData = global.robotMiningSite.entityData
	global.robotMiningSite.version = "0.3.0"
	scheduleText("Migrated to robotMiningSite 0.3.0")
end

function scheduleText(text)
	if not global.schedule[TICK_ASAP] then
		global.schedule[TICK_ASAP]={}
	end
	global.schedule[TICK_ASAP]["text"]=text
end
