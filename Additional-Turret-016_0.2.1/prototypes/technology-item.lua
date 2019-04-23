data:extend({
{
  type = "technology",
  name = "piranha-research",
  icon_size = 128,
  icon = "__Additional-Turret-016__/graphics/technology/piranha-research.png",
  effects =
  {
    {
      type = "unlock-recipe",
      recipe = "piranha-core"
    },
	{
      type = "unlock-recipe",
      recipe = "piranha-solution"
    },
	{
      type = "unlock-recipe",
      recipe = "acid-thrower-ammo"
	},
  },
  prerequisites = {"acid-thrower"},
  unit =
  {
    count = 250,
    ingredients =
    {
      {"science-pack-1", 1},
      {"science-pack-2", 1}
    },
    time = 25
  },
  order = "e-c-b-b"
},
})