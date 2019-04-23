local math3d = require "math3d"
local laser_acceleration = 0-- .05

local sticker_option = {
	electronic = {
		tint = {r = 0.5, g = 0.5, b = 0.5, a = 0.3},
		target_movement_modifier = 0.4,
		duration_in_ticks = 0.5 * 60,
		damage_per_tick = { amount = 5 / 60, type = "electric" }
	},
	poison = {
		tint = {r = 0.5, g = 0.5, b = 0.5, a = 0.3},
		target_movement_modifier = 0.8,
		duration_in_ticks = 10 * 60,
		damage_per_tick = { amount = 50 / 60, type = "poison" }
	},
	wall_electroic = {
		tint = {r = 0.8, g = 0.8, b = 0.8, a = 0.5},
		target_movement_modifier = 0.6,
		duration_in_ticks = 0.3 * 60,
		damage_per_tick = { amount = 35 / 60, type = "electric" }
	}
}

local animation_fake = {
	filename = "__Additional-Turret-016__/graphics/blank.png",
	frame_count = 1,
	width = 1,
	height = 1,
	priority = "high"
}

function sticker_set(inputs)
return
{
	type = "sticker",
	name = inputs.name,
	flags = {"not-on-map"},
	
	animation = 
	{
		filename = inputs.filename and inputs.filename or "__Additional-Turret-016__/graphics/entity/spark.png",
		line_length = inputs.line_length and inputs.line_length or 5,
		width = inputs.width and inputs.width or 64,
		height = inputs.height and inputs.height or 64,
		frame_count = inputs.frame_count and inputs.frame_count or 5,
		axially_symmetrical = false,
		direction_count = inputs.direction_count and inputs.direction_count or 1,
		blend_mode = "normal",
		animation_speed = 0.5,
		scale = inputs.scale and inputs.scale or 0.5,
		tint = inputs.tint and inputs.tint or electric_tint,
		shift = math3d.vector2.mul({-0.078125, -1.8125}, 0.1),
	},
	duration_in_ticks = inputs.duration_in_ticks and inputs.duration_in_ticks or 7 * 60,
	target_movement_modifier = inputs.target_movement_modifier and inputs.target_movement_modifier or 0.4,
	damage_per_tick = inputs.damage_per_tick and inputs.damage_per_tick or electric_damage_per_tick
}
end
-- sticker_set{name="", filename="", line_length=, width=, height=, frame_count=, direction_count=, scale=, tint =, duration_in_ticks =, target_movement_modifier =, damage_per_tick =},

data:extend({
--------------laser beam
{
	type = "projectile",
	name = "electron-beam-1",
	flags = {"not-on-map"},
	acceleration = laser_acceleration,
	action =
	{
		type = "direct",
		action_delivery =
		{
			type = "instant",
			target_effects =
			{
				{
					type = "create-entity",
					entity_name = "laser-bubble"
				},
				{
					type = "damage",
					damage = { amount = 125, type = "laser"}
				},
				{
					type = "create-sticker",
					sticker = "electronic-sticker"
				},
			}
		}
	},
	animation = animation_fake,
},
{
	type = "projectile",
	name = "electron-beam-2",
	flags = {"not-on-map"},
	direction_only = true,
	acceleration = laser_acceleration,
	action =
	{
		type = "direct",
		action_delivery =
		{
			type = "instant",
			target_effects =
			{
				{
					type = "create-entity",
					entity_name = "laser-bubble"
				},
			}
		}
	},
	light = {intensity = 0.5, size = 10},
	animation =
	{
		filename = "__base__/graphics/entity/laser/laser-to-tint-medium.png",
		tint = {r=1, g=0.78, b=0},
		scale = 5,
		frame_count = 1,
		width = 12,
		height = 33,
		priority = "high",
		blend_mode = "additive"
	},
},
{
	type = "projectile",
	name = "at-advanced-laser-1",
	flags = {"not-on-map"},
	acceleration = 0.005,
	action =
	{
		type = "direct",
		action_delivery =
		{
			type = "instant",
			target_effects =
			{
				{
					type = "create-entity",
					entity_name = "laser-bubble"
				},
				{
					type = "damage",
					damage = { amount = 5, type = "laser"}
				},
			}
		}
	},
	light = {intensity = 0.5, size = 10},
	animation =
	{
		filename = "__base__/graphics/entity/laser/laser-to-tint-medium.png",
		tint = {r=0.02, g=1, b=0.38},
		frame_count = 1,
		width = 12,
		height = 33,
		priority = "high",
		blend_mode = "additive"
	},
},

------------- dummy
{
	type = "projectile",
	name = "dummy_entity",
	flags = {"not-on-map"},
	acceleration = 0,
	animation = animation_fake,

},

{
	type = "projectile",
	name = "guid-flash",
	flags = {"not-on-map"},
	acceleration = 0,
	animation = 
	{
		filename = "__core__/graphics/visualization-construction-radius.png",
		priority = "extra-high",
		width = 12,
		height = 12,
		frame_count = 1,
		line_length = 1,	
		animation_speed = 0.5
	},
	light = {intensity = 0.5, size = 6}

},
})

data:extend
({
	sticker_set{
		name="electronic-sticker", filename="__Additional-Turret-016__/graphics/entity/spark.png",
		line_length=5, width=64, height=64, frame_count=5, direction_count=1, scale=0.5,
		target_movement_modifier = sticker_option.electronic.target_movement_modifier,
		tint = sticker_option.electronic.tint,
		duration_in_ticks = sticker_option.electronic.duration_in_ticks,
		damage_per_tick = sticker_option.electronic.damage_per_tick
	},

	sticker_set{name="poison-sticker", filename="__Additional-Turret-016__/graphics/entity/spark.png",
		line_length=5, width=64, height=64, frame_count=5, direction_count=1, scale=0.5,
		target_movement_modifier = sticker_option.poison.target_movement_modifier,
		tint = sticker_option.poison.tint,
		duration_in_ticks = sticker_option.poison.duration_in_ticks,
		damage_per_tick = sticker_option.poison.damage_per_tick
	},
	
	sticker_set{name="wall-electroic-sticker", filename="__Additional-Turret-016__/graphics/entity/spark.png",
		line_length=5, width=64, height=64, frame_count=5, direction_count=1, scale=0.5,
		target_movement_modifier = sticker_option.wall_electroic.target_movement_modifier,
		tint = sticker_option.wall_electroic.tint,
		duration_in_ticks = sticker_option.wall_electroic.duration_in_ticks,
		damage_per_tick = sticker_option.wall_electroic.damage_per_tick
	},
})