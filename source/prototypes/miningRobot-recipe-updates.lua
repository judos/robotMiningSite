if robotMiningSite.settings.botsUpgrade == true then
  add_ingredient("mining-robot-2", {"mining-robot", 1})
  add_ingredient("mining-robot-3", {"mining-robot-2", 1})
  add_ingredient("mining-robot-4", {"mining-robot-3", 1})
end


if data.raw.item["flying-robot-frame-2"] then
  add_ingredient("mining-robot-2", {"flying-robot-frame-2", 1})
else
    data.raw.recipe["mining-robot-2"].energy_required = 20

    if robotMiningSite.settings.botsUpgrade == false then
      add_ingredient("mining-robot-2", {"electric-engine-unit", 1})
      add_ingredient("mining-robot-2", {"battery", 2})
    end

    if data.raw.item["aluminium-plate"] then
      add_ingredient("mining-robot-2", {"aluminium-plate", 1})
    else
      add_ingredient("mining-robot-2", {"steel-plate", 1})
    end

    add_ingredient("mining-robot-2", {"advanced-circuit", 3})
end



if data.raw.item["flying-robot-frame-3"] then
  add_ingredient("mining-robot-3", {"flying-robot-frame-3", 1})
else
    data.raw.recipe["mining-robot-3"].energy_required = 20

    if robotMiningSite.settings.botsUpgrade == false then
      add_ingredient("mining-robot-3", {"electric-engine-unit", 1})
    end

    if data.raw.item["lithium-ion-battery"] then
      add_ingredient(robot, {"lithium-ion-battery", 2})
    else
      add_ingredient("mining-robot-3", {"battery", 2})
    end

    if data.raw.item["titanium-plate"] then
      add_ingredient("mining-robot-3", {"titanium-plate", 1})
    else
      add_ingredient("mining-robot-3", {"steel-plate", 1})
    end

    add_ingredient("mining-robot-3", {"processing-unit", 3})
end



if data.raw.item["flying-robot-frame-4"] then
  add_ingredient("mining-robot-4", {"flying-robot-frame-4", 1})
else
    data.raw.recipe["mining-robot-4"].energy_required = 20
    if robotMiningSite.settings.botsUpgrade == false then
      add_ingredient("mining-robot-4", {"electric-engine-unit", 1})
    end

    if data.raw.item["silver-zinc-battery"] then
      add_ingredient("mining-robot-4", {"silver-zinc-battery", 2})
    else
      if data.raw.item["lithium-ion-battery"] then
        add_ingredient("mining-robot-4", {"lithium-ion-battery", 2})
      else
        add_ingredient("mining-robot-4", {"battery", 2})
      end
    end

    if data.raw.item["silicon-nitride"] then
      add_ingredient("mining-robot-4", {"silicon-nitride", 1})
    else
      add_ingredient("mining-robot-4", {"steel-plate", 1})
    end

    if data.raw.item["advanced-processing-unit"] then
      add_ingredient("mining-robot-4", {"advanced-processing-unit", 3})
    else
      add_ingredient("mining-robot-4", {"processing-unit", 3})
    end
end

if data.raw.item["robot-brain-construction-2"] and data.raw.item["robot-tool-construction-2"] then
  add_ingredient("mining-robot-2", {"robot-brain-construction-2", 1})
else
  add_ingredient("mining-robot-2", {"advanced-circuit", 1})
end

if data.raw["mining-tool"]["brass-axe"] then
  add_ingredient("mining-robot-2", {"brass-axe", 2})
else
  add_ingredient("mining-robot-2", {"steel-axe", 3})
end

if data.raw.item["robot-brain-construction-3"] then
  add_ingredient("mining-robot-3", {"robot-brain-construction-3", 1})
else
  add_ingredient("mining-robot-3", {"processing-unit", 1})
end

if data.raw["mining-tool"]["brass-axe"] then
  add_ingredient("mining-robot-3", {"cobalt-axe", 2})
else
  add_ingredient("mining-robot-3", {"steel-axe", 4})
end


if data.raw.item["robot-brain-construction-4"] and data.raw.item["robot-tool-construction-4"] then
  add_ingredient("mining-robot-4", {"robot-brain-construction-4", 1})
else
  if data.raw.item["advanced-processing-unit"] then
    add_ingredient("mining-robot-4", {"advanced-processing-unit", 1})
  else
    add_ingredient("mining-robot-4", {"processing-unit", 1})
  end
end

if data.raw["mining-tool"]["titanium-axe"] then
  add_ingredient("mining-robot-4", {"titanium-axe", 2})
else
  add_ingredient("mining-robot-4", {"steel-axe", 5})
end

add_ingredient("mining-robot-5", {"fusion-reactor-equipment", 1})

if robotMiningSite.settings.botsUpgrade == true then
  add_ingredient("mining-robot-5", {"mining-robot-4", 1})
else
  if data.raw.item["flying-robot-frame-4"] then
    add_ingredient("mining-robot-5", {"flying-robot-frame-4", 1})
  else
      data.raw.recipe["mining-robot-5"].energy_required = 20
      add_ingredient("mining-robot-5", {"electric-engine-unit", 1})

      if data.raw.item["silicon-nitride"] then
        add_ingredient("mining-robot-5", {"silicon-nitride", 1})
      else
        add_ingredient("mining-robot-5", {"steel-plate", 1})
      end

      if data.raw.item["advanced-processing-unit"] then
        add_ingredient("mining-robot-5", {"advanced-processing-unit", 3})
      else
        add_ingredient("mining-robot-5", {"processing-unit", 3})
      end
  end
end

  if data.raw.item["robot-brain-construction-4"] then
    add_ingredient("mining-robot-5", {"robot-brain-construction-4", 1})
  else
    if data.raw.item["advanced-processing-unit"] then
      add_ingredient("mining-robot-5", {"advanced-processing-unit", 1})
    else
      add_ingredient("mining-robot-5", {"processing-unit", 1})
    end
  end

  if data.raw["mining-tool"]["diamond-axe"] then
    add_ingredient("mining-robot-5", {"diamond-axe", 2})
  else
    add_ingredient("mining-robot-5", {"steel-axe", 10})
  end

