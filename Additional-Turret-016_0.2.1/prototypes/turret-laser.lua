local laser_range = 8
local test_1_range_md = 3
local test_2_range_md = 5
local laser_tint_1 = {r=0.7, g=0.2, b=0.1, a=1} --test1, only beam 2*2
local laser_tint_2 = {r=0.3, g=0.7, b=0.5, a=1} --advanced laser, fast shot 3*3
local laser_tint_3 = {r=0,g=0,b=0,a=0} --test2, beam with sticker 4*4
local laser_1_scale = 0.5
local laser_2_scale = 0.75
local laser_3_scale = 1
local laser_1_shift = { 0.21875, -0.9375}
local laser_2_shift = { 0.328125, -1.40625}
local laser_3_shift = { 0.4375, -1.875}

function advanced_laser_place(inputs)
return
{
	layers = 
	{
		{
			filename = "__Additional-Turret-016__/graphics/entity/advanced-laser-place.png",
			priority = "medium",
			scale = inputs.scale,
			width = 256,
			height = 256,
			frame_count = 1,
			direction_count = 8,
			axially_symmetrical = false,
			run_mode = inputs.run_mode and inputs.run_mode or "forward",
			shift = inputs.shift,
		},
		{
			filename = "__Additional-Turret-016__/graphics/entity/advanced-laser-place-mask.png",
			flags = { "mask" },
			scale = inputs.scale,
			width = 256,
			height = 256,
			frame_count = 1,
			axially_symmetrical = false,
			run_mode = inputs.run_mode and inputs.run_mode or "forward",
			tint = inputs.tint,
			direction_count = 8,
			shift = inputs.shift,
		},
	},
}
end

function advanced_laser_sheet(inputs)
return
{
	layers = 
	{
		{
			filename = "__Additional-Turret-016__/graphics/entity/advanced-laser-sheet.png",
			priority = "medium",
			scale = inputs.scale,
			width = 256,
			height = 256,
			frame_count = 1,
			direction_count = 64,
			line_length = 8,
			axially_symmetrical = false,
			shift = inputs.shift,
		},
		{
			filename = "__Additional-Turret-016__/graphics/entity/advanced-laser-sheet-mask.png",
			flags = { "mask" },
			scale = inputs.scale,
			line_length = 8,
			width = 256,
			height = 256,
			frame_count = 1,
			axially_symmetrical = false,
			tint = inputs.tint,
			direction_count = 64,
			shift = inputs.shift,
		},
	}
}
end








data:extend({

{
	type = "electric-turret",
	name = "at-beam-turret-mk1",
	icon = "__Additional-Turret-016__/graphics/icon/turret-beam-1-icon.png",
	icon_size = 32,
	flags = { "placeable-player", "placeable-enemy", "player-creation"},
	minable = { mining_time = 0.5, result = "at-beam-turret-mk1" },
	max_health = 700,
	corpse = "medium-remnants",
	collision_box = {{ -0.7, -0.7}, {0.7, 0.7}},
	selection_box = {{ -1, -1}, {1, 1}},
	rotation_speed = 0.01,
	preparing_speed = 0.05,
	dying_explosion = "medium-explosion",
	folding_speed = 0.05,
	
	resistances = 
	{
		{
			type = "laser",
			decrease = 50,
			percent = 70
		},
	},
	
	energy_source =
	{
		type = "electric",
		buffer_capacity = "15MJ", --"801kJ",
		input_flow_limit = "10.5MW", --"9600kW",
		drain = "72kW",
		usage_priority = "primary-input"
	},
	
	folded_animation = advanced_laser_place{scale = laser_1_scale, tint = laser_tint_1, shift = laser_1_shift},
	preparing_animation = advanced_laser_place{scale = laser_1_scale, tint = laser_tint_1, shift = laser_1_shift},
	prepared_animation = advanced_laser_sheet{scale = laser_1_scale, tint = laser_tint_1, shift = laser_1_shift},
	attacking_animation = advanced_laser_sheet{scale = laser_1_scale, tint = laser_tint_1, shift = laser_1_shift},
	folding_animation = advanced_laser_place{scale = laser_1_scale, tint = laser_tint_1, shift = laser_1_shift, run_mode = "backward"},
	
	vehicle_impact_sound =	{ filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },

	attack_parameters =
	{
		type = "projectile",
		ammo_category = "electric",
		cooldown = 120,
		projectile_center = {0, -0.4375},
		projectile_creation_distance = 1.5,
		range = laser_range * test_1_range_md,
		turn_range = 1/6,
		damage_modifier = 1,
		ammo_type =
		{
			category = "railgun",
			target_type = "direction",
			energy_consumption = "10MJ", --"800kJ",
			action =
			{
				type = "line",
				range = laser_range * test_1_range_md * 2,
				width = 2,

				source_effects =
				{
					type = "create-explosion",
					entity_name = "railgun-beam"
				},
				action_delivery =
				{
					type = "instant",
					target_effects =
					{
						type = "damage",
						damage = { amount = 100, type="laser"}
					},
				}
			}
		},
		sound =
		{
			{
				filename = "__Additional-Turret-016__/sound/laser_1_sound.ogg",
				volume = 0.7
			}
		},
	},
	call_for_help_radius = laser_range * test_1_range_md * 4,
},
{
	type = "electric-turret",
	name = "at-advanced-laser",
	icon = "__Additional-Turret-016__/graphics/icon/turret-advanced-laser-icon.png",
	icon_size = 32,
	flags = { "placeable-player", "placeable-enemy", "player-creation"},
	minable = { mining_time = 0.5, result = "at-advanced-laser" },
	max_health = 1000,
	corpse = "big-remnants",
	collision_box = {{ -1.2, -1.2}, {1.2, 1.2}},
	selection_box = {{ -1.5, -1.5}, {1.5, 1.5}},
	rotation_speed = 0.01,
	preparing_speed = 0.05,
	dying_explosion = "big-explosion",
	folding_speed = 0.05,
	
	resistances = 
	{
		{
			type = "laser",
			decrease = 50,
			percent = 90
		},
	},
	
	energy_source =
	{
		type = "electric",
		buffer_capacity = "50MJ", --"801kJ",
		input_flow_limit = "17MW", --"9600kW",
		drain = "42kW",
		usage_priority = "primary-input"
	},
	
	folded_animation = advanced_laser_place{scale = laser_2_scale, tint = laser_tint_2, shift = laser_2_shift},
	preparing_animation = advanced_laser_place{scale = laser_2_scale, tint = laser_tint_2, shift = laser_2_shift},
	prepared_animation = advanced_laser_sheet{scale = laser_2_scale, tint = laser_tint_2, shift = laser_2_shift},
	attacking_animation = advanced_laser_sheet{scale = laser_2_scale, tint = laser_tint_2, shift = laser_2_shift},
	folding_animation = advanced_laser_place{scale = laser_2_scale, tint = laser_tint_2, shift = laser_2_shift, run_mode = "backward"},
	
	vehicle_impact_sound =	{ filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },

	attack_parameters =
	{
		type = "projectile",
		ammo_category = "electric",
		cooldown = 4,
		projectile_center = {0, -0.65625},
		projectile_creation_distance = 2.5,
		range = 30,
		damage_modifier = 3,
		ammo_type =
		{
			type = "projectile",
			category = "laser-turret",
			energy_consumption = "1MJ",
			action =
			{
				{
					type = "direct",
					action_delivery =
					{
						{
							type = "projectile",
							projectile = "at-advanced-laser-1",
							starting_speed = 0.75
						}
					}
				}
			}
		},
		sound = make_laser_sounds()
	},
	call_for_help_radius = 60
},
{
	type = "electric-turret",
	name = "at-beam-turret-mk2",
	icon = "__Additional-Turret-016__/graphics/icon/turret-beam-2-icon.png",
	icon_size = 32,
	flags = { "placeable-player", "placeable-enemy", "player-creation"},
	minable = { mining_time = 0.5, result = "at-beam-turret-mk2" },
	max_health = 1500,
	corpse = "big-remnants",
	collision_box = {{ -1.7, -1.7}, {1.7, 1.7}},
	selection_box = {{ -2, -2}, {2, 2}},
	rotation_speed = 0.007,
	preparing_speed = 0.05,
	dying_explosion = "big-explosion",
	folding_speed = 0.05,
	
	resistances = 
	{
		{
			type = "laser",
			decrease = 50,
			percent = 90
		},
	},
	
	energy_source =
	{
		type = "electric",
		buffer_capacity = "100MJ", --"801kJ",
		input_flow_limit = "50MW", --"9600kW",
		drain = "42kW",
		usage_priority = "primary-input"
	},
	folded_animation = advanced_laser_place{scale = laser_3_scale, tint = laser_tint_3, shift = laser_3_shift},
	preparing_animation = advanced_laser_place{scale = laser_3_scale, tint = laser_tint_3, shift = laser_3_shift},
	prepared_animation = advanced_laser_sheet{scale = laser_3_scale, tint = laser_tint_3, shift = laser_3_shift},
	attacking_animation = advanced_laser_sheet{scale = laser_3_scale, tint = laser_tint_3, shift = laser_3_shift},
	folding_animation = advanced_laser_place{scale = laser_3_scale, tint = laser_tint_3, shift = laser_3_shift, run_mode = "backward"},
	
	vehicle_impact_sound =	{ filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },

	attack_parameters =
	{
		type = "projectile",
		ammo_category = "electric",
		cooldown = 90,
		projectile_center = {0, -0.875},
		projectile_creation_distance = 4,
		range = laser_range * test_2_range_md,
		damage_modifier = 1,
		ammo_type =
		{
			type = "projectile",
			category = "laser-turret",
			energy_consumption = "50MJ", --"800kJ",
			action =
			{
				{
					type = "line",
					range = laser_range * test_2_range_md * 2,
					width = 3,
					force = "enemy",
					
					action_delivery =
					{
						type = "projectile",
						projectile = "electron-beam-1",
						starting_speed = 5,
					}
				},
				{
					type = "direct",
					action_delivery =
					{
						type = "projectile",
						projectile = "electron-beam-2",
						starting_speed = 5,
						max_range = laser_range * test_2_range_md * 2,
					}
				}
			}
		},
		sound =
		{
			{
				filename = "__Additional-Turret-016__/sound/laser_2_sound.ogg",
				volume = 0.7
			}
		},
	},
	call_for_help_radius = laser_range * test_2_range_md * 4,
},
})




------------recipe
data:extend({
{
	type = "recipe",
	name = "at-advanced-laser",
	enabled = false,
	energy_required = 15,
	ingredients = 
	{
		{"laser-turret", 5},
		{"battery", 5},
		{"beacon", 1},
	},
	result = "at-advanced-laser",
},
{
	type = "recipe",
	name = "at-beam-turret-mk1",
	enabled = false,
	energy_required = 15,
	ingredients = 
	{
		{"laser-turret", 2},
		{"battery", 5},
		{"electronic-circuit", 5},
	},
	result = "at-beam-turret-mk1",
},
{
	type = "recipe",
	name = "at-beam-turret-mk2",
	enabled = false,
	energy_required = 20,
	ingredients = 
	{
		{"at-beam-turret-mk1", 1},
		{"battery", 10},
		{"advanced-circuit", 10},
	},
	result = "at-beam-turret-mk2",
},
})




---------------item
data:extend({
{
	type = "item",
	name = "at-advanced-laser",
	icon = "__Additional-Turret-016__/graphics/icon/turret-advanced-laser-icon.png",
	icon_size = 32,
	flags = {"goes-to-quickbar"},
	subgroup = "defensive-structure",
	order = "b[turret]-b[laser-turret]-a[advanced]",
	place_result = "at-advanced-laser",
	stack_size = 25,
},
{
	type = "item",
	name = "at-beam-turret-mk1",
	icon = "__Additional-Turret-016__/graphics/icon/turret-beam-1-icon.png",
	icon_size = 32,
	flags = {"goes-to-quickbar"},
	subgroup = "defensive-structure",
	order = "b[turret]-b[laser-turret]-b[at-beam-turret-mk1]",
	place_result = "at-beam-turret-mk1",
	stack_size = 30,
},
{
	type = "item",
	name = "at-beam-turret-mk2",
	icon = "__Additional-Turret-016__/graphics/icon/turret-beam-2-icon.png",
	icon_size = 32,
	flags = {"goes-to-quickbar"},
	subgroup = "defensive-structure",
	order = "b[turret]-b[laser-turret]-c[at-beam-turret-mk2]",
	place_result = "at-beam-turret-mk2",
	stack_size = 20,
},
})