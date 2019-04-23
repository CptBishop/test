function turret_unlock(inputs) -- turret_unlock{name, icon, effects, prerequisites, count, ingredients, time, order}
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
		count = inputs.count,
		ingredients = inputs.ingredients,
		time = inputs.time
	},
	upgrade = true,
	order = inputs.order,
}
end

local ingredients_list = {{"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1}, {"military-science-pack", 1}, {"high-tech-science-pack", 1}, {"space-science-pack", 1}}

data:extend({
	
turret_unlock{name = "acid-thrower", icon = "__Additional-Turret-016__/graphics/technology/acid-thrower.png",
	effects = {{type = "unlock-recipe", recipe = "at-acidthrower-turret"}},
	prerequisites = {"flamethrower"}, 
	count = 50, ingredients = {ingredients_list[1], ingredients_list[2], ingredients_list[4]}, time = 30, order = "e-c-b-a"},

turret_unlock{name = "advanced-laser-research", icon = "__Additional-Turret-016__/graphics/technology/ad-laser-turret.png",
	effects = {{type = "unlock-recipe", recipe = "at-advanced-laser"},
		{type = "unlock-recipe", recipe = "at-beam-turret-mk1"}},
	prerequisites = {"laser"}, 
	count = 200, ingredients = {ingredients_list[1], ingredients_list[2], ingredients_list[4]}, time = 30, order = "a-h-e"},

turret_unlock{name = "beam-research", icon = "__Additional-Turret-016__/graphics/technology/beam-turret.png",
	effects = {{type = "unlock-recipe", recipe = "at-beam-turret-mk2"}},
	prerequisites = {"advanced-laser-research"}, 
	count = 250, ingredients = {ingredients_list[1], ingredients_list[2], ingredients_list[3], ingredients_list[4]}, time = 60, order = "a-h-d"},
})