function damage_upgrade(inputs) -- damage_upgrade{name, icon, effects, prerequisites, ingredients, time, max_level, order}
return
{
	type = "technology",
	name = inputs.name,
	icon_size = 128,
	icon = inputs.icon,
	effects = inputs.effects,
	prerequisites = inputs.prerequisites,
	unit =
	{
		count_formula = "100*L",
		ingredients = inputs.ingredients,
		time = inputs.time
	},
	upgrade = true,
	max_level = inputs.max_level,
	order = inputs.order,
}
end

--------------

local name_list = {"thrower-turret-damage-"}
local icon_list = {
	"__Additional-Turret-016__/graphics/technology/acid-thrower-damage.png"
}
local effects_list = {
					{
						-- {
							-- type = "ammo-damage",
							-- ammo_category = "acid-thrower-ammo",
							-- modifier = 0.2
						-- },
						{
							type = "turret-attack",
							turret_id = "at-acidthrower-turret",
							modifier = 0.1,
						}},
					
					}
local prerequisites_list = {"acid-thrower"}
local ingredients_list = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1}, {"military-science-pack", 1}, {"high-tech-science-pack", 1}, {"space-science-pack", 1}}
local time_list = {10, 20, 30, 60, 120}
local max_level_list = {"10", "20", "40", "80", "infinite"}
local next_level = {"11", "21", "41", "81"}
local order_list = {"e-o-q-a", "e-o-q-c", "e-o-q-e", "e-o-p-a"}