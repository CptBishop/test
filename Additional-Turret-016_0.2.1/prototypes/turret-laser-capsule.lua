require ("prototypes.others")

local offset = 0

function at_LC_turret_door_opening(inputs)
return
{
	layers = 
	{
		{
			filename = "__Additional-Turret-016__/graphics/entity/opening.png",
			-- priority = "medium",
			width = 52,
			height = 52,
			direction_count = 1,
			frame_count = inputs.frame_count and inputs.frame_count or 16,
			run_mode = inputs.run_mode and inputs.run_mode or "forward",
			shift = { 0, offset },
		},
	}
}
end

function at_LC_turret_door_open(inputs)
return
{
	layers = 
	{
		{
			filename = "__Additional-Turret-016__/graphics/entity/open.png",
			-- priority = "medium",
			width = 52,
			height = 52,
			direction_count = 1,
			frame_count = 1,
			-- run_mode = inputs.run_mode and inputs.run_mode or "forward",
			shift = { 0, offset },
		},
	}
}
end

function at_LC_base(inputs)
return
{
	layers = 
	{
		{
			filename = "__Additional-Turret-016__/graphics/entity/base.png",
			-- priority = "medium",
			scale = 1,
			width = 224,
			height = 224,
			direction_count = 1,
			frame_count = 1,
			line_length = 1,
			axially_symmetrical = false,
			-- run_mode = inputs.run_mode and inputs.run_mode or "forward",
			shift = { 0, 0 },
		},
	}
}
end

function bundle_LT_extension(inputs)
return
{
	filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-start.png",
	priority = "medium",
	width = 66,
	height = 67,
	frame_count = inputs.frame_count and inputs.frame_count or 15,
	line_length = inputs.line_length and inputs.line_length or 0,
	run_mode = inputs.run_mode and inputs.run_mode or "forward",
	axially_symmetrical = false,
	direction_count = 4,
	shift = {0.0625, -0.584375} --{0.0625, -0.984375}
}
end

function bundle_LT_extension_shadow(inputs)
return
{
	filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-start-shadow.png",
	width = 92,
	height = 50,
	frame_count = inputs.frame_count and inputs.frame_count or 15,
	line_length = inputs.line_length and inputs.line_length or 0,
	run_mode = inputs.run_mode and inputs.run_mode or "forward",
	axially_symmetrical = false,
	direction_count = 4,
	draw_as_shadow = true,
	shift = {0.96875, 0}, --{1.46875, 0}
}
end

function bundle_LT_extension_mask(inputs)
return
{
	filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-start-mask.png",
	flags = { "mask" },
	width = 51,
	height = 47,
	frame_count = inputs.frame_count and inputs.frame_count or 15,
	line_length = inputs.line_length and inputs.line_length or 0,
	run_mode = inputs.run_mode and inputs.run_mode or "forward",
	axially_symmetrical = false,
	apply_runtime_tint = true,
	direction_count = 4,
	shift = {0.078125, -0.86563}, --{0.078125, -1.26563},
}
end

function blank(inputs)
return
{
	layers = 
	{
		{
			filename = "__Additional-Turret-016__/graphics/blank.png",
			priority = "medium",
			width = 1,
			height = 1,
			direction_count = 1,
			frame_count = 1,
			axially_symmetrical = false,
			shift = at_Artillery_mk2_shift,
		}
	}
}
end

function base()
return
{
	layers = 
	{
		{
			filename = "__Additional-Turret-016__/graphics/base.png",
			width = 224,
			height = 224,
			direction_count = 1,
			frame_count = 1,
			axially_symmetrical = false,
			shift = {0, 0},
		}
	}
}
end

function laser_copse(inputs)
return
{
	type = "container",
	name = inputs.name,
	icon = "__Additional-Turret-016__/graphics/icon/turret-lc-icon.png",
	icon_size = 32,
	flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
	selectable_in_game = false,
	order = "b[turret]-b[laser-turret]-d[at_LC_base]",
	max_health = 500 * 1.3,
	collision_box = {{ -0.5, -0.5}, {0.5, 0.5}},
	-- selection_box = {{ -1, -1}, {1, 1}},
	fast_replaceable_group = "container",
	inventory_size = 0,
	picture = {
		filename = "__base__/graphics/entity/remnants/medium-remnants.png",
		priority = "extra-high",
		width = 94,
		height = 82,
		frame_count = 1,
		direction_count = 4,
		shift = {0, 0}
	},
}
end

function laser_turret(inputs)
return
{
	type = "electric-turret",
	name = inputs.name,
	icon = "__Additional-Turret-016__/graphics/icon/turret-lc-icon.png",
	icon_size = 32,
	flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
	selectable_in_game = false,
	order = "b[turret]-b[laser-turret]-d[at_LC_base]",
	max_health = 500,
	-- corpse = "medium-remnants",
	collision_box = {{ -1.5, -1.5}, {1.5, 1.5}},
	selection_box = {{ -1, -1}, {1, 1}},
	rotation_speed = 0.01,
	preparing_speed = 0.05,
	dying_explosion = "medium-explosion",
	folding_speed = 0.05,
	energy_source =
	{
		type = "electric",
		buffer_capacity = "801kJ",
		input_flow_limit = "9600kW",
		drain = "24kW",
		usage_priority = "primary-input"
	},
	folded_animation =
	{
		layers =
		{
			bundle_LT_extension{frame_count=1, line_length = 1},
			bundle_LT_extension_shadow{frame_count=1, line_length=1},
			bundle_LT_extension_mask{frame_count=1, line_length=1}
		}
	},
	preparing_animation =
	{
		layers =
		{
			bundle_LT_extension{},
			bundle_LT_extension_shadow{},
			bundle_LT_extension_mask{}
		}
	},
	prepared_animation =
	{
		layers =
		{
			{
				filename = "__base__/graphics/entity/laser-turret/laser-turret-gun.png",
				line_length = 8,
				width = 68,
				height = 68,
				frame_count = 1,
				axially_symmetrical = false,
				direction_count = 64,
				shift = {0.0625, -0.6} --{0.0625, -1}
			},
			{
				filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-mask.png",
				flags = { "mask" },
				line_length = 8,
				width = 54,
				height = 44,
				frame_count = 1,
				axially_symmetrical = false,
				apply_runtime_tint = true,
				direction_count = 64,
				shift = {0.0625, -0.9125}, --{0.0625, -1.3125},
			},
			{
				filename = "__base__/graphics/entity/laser-turret/laser-turret-gun-shadow.png",
				line_length = 8,
				width = 88,
				height = 52,
				frame_count = 1,
				axially_symmetrical = false,
				direction_count = 64,
				draw_as_shadow = true,
				shift = {1.09375, 0} --{1.59375, 0}
			}
		}
	},
	folding_animation = 
	{
		layers =
		{
			bundle_LT_extension{run_mode = "backward"},
			bundle_LT_extension_shadow{run_mode = "backward"},
			bundle_LT_extension_mask{run_mode = "backward"}
		}
	},
	
	vehicle_impact_sound =	{ filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },

	attack_parameters =
	{
		type = "projectile",
		ammo_category = "electric",
		cooldown = 10,
		projectile_center = {0, 0.2}, --{0, -0.2}
		projectile_creation_distance = 1.4,
		range = 17,
		damage_modifier = 3,
		ammo_type =
		{
			type = "projectile",
			category = "laser-turret",
			energy_consumption = "800kJ",
			action =
			{
				{
					type = "direct",
					action_delivery =
					{
						{
							type = "projectile",
							projectile = "laser",
							starting_speed = 0.28
						}
					}
				}
			}
		},
		sound = make_laser_sounds()
	},
	call_for_help_radius = 30
}
end



data:extend({
{
	type = "ammo-turret",
	name = "at_LC_b",
	icon = "__Additional-Turret-016__/graphics/icon/turret-lc-icon.png",
	icon_size = 32,
	flags = {"placeable-neutral", "placeable-player", "player-creation", "not-repairable"},
	minable = {mining_time = 1.5, result = "at_LC_b"},
	order = "b[turret]-b[laser-turret]-d[at_LC_base]",
	max_health = 2000,
	corpse = "big-remnants",
	dying_explosion = "massive-explosion",
	
	collision_box = {{-3.2, -3.2 }, {3.2, 3.2}},
	selection_box = {{-3.5, -3.5 }, {3.5, 3.5}},
	
	folding_speed = 0.04,
	inventory_size = 1,
	automated_ammo_count = 10,
	
	folded_animation = blank{},
	folding_animation = blank{},
	base_picture = at_LC_base{},
	
	vehicle_impact_sound =	{ filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
	
	attack_parameters =
	{
		type = "projectile",
		ammo_category = "capsule",
		cooldown = 60 * 2,
		range = 30,
		sound =
		{
			{
				filename = "__Additional-Turret-016__/sound/LC_turret_sound.ogg",
				volume = 1
			}
		},
	},

	call_for_help_radius = 50
},
{
	type = "logistic-container",
	name = "at_LC_i1",
	icon = "__Additional-Turret-016__/graphics/icon/turret-lc-icon.png",
	icon_size = 32,
	flags = {"placeable-neutral", "placeable-player", "player-creation"},
	order = "b[turret]-b[laser-turret]-d[at_LC_base]",
	max_health = 300,
	corpse = "big-remnants",
	dying_explosion = "massive-explosion",
	collision_box = {{-0.5, -0.5 }, {0.5, 0.5}}, --{{-3.2, -3.2 }, {3.2, 3.2}},
	selection_box = {{-0.5, -0.5 }, {0.5, 0.5}},
	fast_replaceable_group = "container",
	inventory_size = 1,
	logistic_mode = "requester",
	logistic_slots_count = 1,
	-- picture = at_LC_turret_door_open{},
	picture = {
		filename = "__base__/graphics/entity/logistic-chest/logistic-chest-requester.png",
		priority = "extra-high",
		width = 38,
		height = 32,
		shift = {0.09375, 0}
	},
    circuit_wire_connection_point =
    {
      shadow =
      {
        red = {0.734375, 0.453125},
        green = {0.609375, 0.515625},
      },
      wire =
      {
        red = {0.40625, 0.21875},
        green = {0.40625, 0.375},
      }
    },
    circuit_wire_max_distance = 7.5,
    circuit_connector_sprites = get_circuit_connector_sprites({0.1875, 0.15625}, nil, 18),
},
laser_turret{name = "at_LC_s"},
laser_copse{name = "at_LC_c"}
})
-- data:extend({
	-- laser_turret{name = "at_LC_s"},
	-- laser_copse{name = "at_LC_c"}
-- })


--item
data:extend({
{
	type = "item",
	name = "at_LC_b",
	icon = "__Additional-Turret-016__/graphics/icon/turret-lc-icon.png",
	icon_size = 32,
	flags = {"goes-to-quickbar"},
	subgroup = "defensive-structure",
	order = "b[turret]-b[laser-turret]-d[at_LC_base]",
	place_result = "at_LC_b",
	stack_size = 50,
}
})	


--recipe
data:extend({
{
	type = "recipe",
	name = "at_LC_b",
	enabled = false,
	energy_required = 15,
	ingredients =
	{
		{"laser-turret", 4},
		{"steel-plate", 8},
		{"pump", 2},
		{"logistic-chest-requester", 1}
	},
	result = "at_LC_b",
},
})