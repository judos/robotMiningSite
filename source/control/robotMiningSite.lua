
function miningSiteWasBuilt(entity)
	info("Entity built in tick "..game.tick.." and added it for update tick")
	scheduleAdd(entity, game.tick + updateEveryTicks)
end

-- parameters: entity
-- return values: tickDelayForNextUpdate, reasonMessage
function runMiningSiteInstructions(entity)
	local network = entity.surface.find_logistic_network_by_position(entity.position,entity.force)
	if not network then	return updateEveryTicksWaiting,"no logistics network" end
	local robots = network.available_construction_robots
	robots = math.max(robots-9,0)
	if not robots then return updateEveryTicksWaiting,"no robots available" end
	
	local r = 10 --range
	local p = entity.position
	local searchArea = {{p.x - r, p.y - r}, {p.x + r, p.y + r}}
	local resources = entity.surface.find_entities_filtered{area = searchArea, type="resource"}
	if not resources or #resources == 0 then
		return updateEveryTicksWaiting,"no resources available"
	end
	
	local networkCell = network.find_cell_closest_to(entity.position)
	if not networkCell then return updateEveryTicksWaiting,"no network cell" end
	local energyRoboport = networkCell.owner
	if not energyRoboport then return updateEveryTicksWaiting,"no roboport found" end
	
	local detectCollision = {}
	for i=1,robots do
		local n = math.random(#resources)
		local stack = {name=resources[n].name,count=1}
		local position = resources[n].position
		if stack.name then
			-- check collision with other entities
			if not detectCollision[position.x] then detectCollision[position.x]={} end
			if not detectCollision[position.x][position.y] then
				local area = {{math.floor(position.x),math.floor(position.y)},{math.ceil(position.x),math.ceil(position.y)}}
				local count = entity.surface.count_entities_filtered{area=area}
				detectCollision[position.x][position.y] = count
			end
			if detectCollision[position.x][position.y] == 1 then
			
				if energyRoboport.energy >= energyPerMining then
					energyRoboport.energy = energyRoboport.energy - energyPerMining
				else
					return updateEveryTicksWaiting,"roboport has no energy"
				end
				if resources[n].amount>1 then
					resources[n].amount = resources[n].amount - 1
				else
					resources[n].destroy()
					table.remove(resources,n)
					if #resources==0 then break end
				end
				
				local itemEntity = entity.surface.create_entity{stack=stack,position=position,name="item-on-ground"}
				detectCollision[position.x][position.y]=detectCollision[position.x][position.y]+1
				if itemEntity and itemEntity.valid then
					itemEntity.order_deconstruction(entity.force)
				end
			end
		end
	end
	
	return updateEveryTicks,"working..."
end