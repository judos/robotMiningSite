data:extend(
{
  {
    type = "bool-setting",
    name = "robotMiningSite_EasyT1",
    setting_type = "startup",
    default_value = false,
  },
    {
      type = "bool-setting",
      name = "useBotGrades",
      setting_type = "startup",
      default_value = false,
    },
    {
      type = "bool-setting",
      name = "needPreviousGrade",
      setting_type = "startup",
      default_value = false,
    }
})
if mods["boblogistics"] then
  data:extend({
    {
      type = "bool-setting",
      name = "useBobRobotics",
      setting_type = "startup",
      default_value = false,
    }
  })
end 