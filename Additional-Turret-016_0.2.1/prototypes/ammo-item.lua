data:extend({
{
    type = "ammo",
    name = "acid-thrower-ammo",
    icon = "__Additional-Turret-016__/graphics/icon/ammo-acid-thrower-icon.png",
	icon_size = 32,
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      {
        source_type = "default",
        category = "flamethrower",
        target_type = "position",
        clamp_position = true,

        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "handheld-flamethrower-acid-stream",
            max_length = 15,
            duration = 160,
          }
        }
      },
      {
        source_type = "vehicle",
        consumption_modifier = 1.125,
        category = "flamethrower",
        target_type = "position",
        clamp_position = true,

        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "tank-flamethrower-fire-stream",
            max_length = 9,
            duration = 160,
          }
        }
      }
    },
    magazine_size = 100,
    subgroup = "ammo",
    order = "e[flamethrower]-a[acid-thrower]",
    stack_size = 100
  },

------------- dummy
{
	type = "ammo",
	name = "dummy",
	icon = "__core__/graphics/shoot.png",
	icon_size = 32,
	flags = {"hidden"},
	ammo_type =
	{
		category = "dummy",
		action =
		{
			type = "direct",
			action_delivery =
			{
				type = "projectile",
				projectile = "dummy_entity",
				starting_speed = 1,
			}
		},
	},
	subgroup = "ammo",
	order = "d[cannon-shell]-c[basic]-a[basic]",
	magazine_size = 10,
	stack_size = 1000
},
})