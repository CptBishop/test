function get_circuit_connector_sprites(mainOffset, shadowOffset, connectorNumber)
	local logisticAnimationOffsets = 
	{
		{-0.171875, -0.109375}, -- 0
		{0, 0}, -- 1 (missing)
		{0.015625, 0.015625},
		{0.140625, -0.015625},
		{0.203125, -0.109375},
		{0.140625, -0.203125}, --5
		{0.015625, -0.234375},
		{-0.109375, -0.203125},
		{-0.234375, -0.015625},
		{-0.171875, 0.109375},
		{0.015625, 0.140625}, -- 10
		{0.203125, 0.078125},
		{0.265625, -0.046875},
		{0.203125, -0.171875},
		{0.015625, -0.234375},
		{-0.203125, -0.203125}, --15
		{-0.265625, 0.046875},
		{-0.171875, 0.171875},
		{0.015625, 0.234375},
		{0.171875, 0.171875},
		{0.265625, 0.046875}, -- 20
		{0.171875, -0.109375},
		{-0.015625, -0.171875},
		{-0.203125, -0.078125},
		{-0.203125, 0.140625},
		{-0.140625, 0.234375}, --25
		{0.015625, 0.265625},
		{0.140625, 0.234375},
		{0.203125, 0.140625},
		{0.109375, -0.140625},
		{-0.015625, -0.203125}, --30
		{-0.140625, -0.078125},
	};
	local result = 
	{
		connector_main =
		{
			filename = "__Additional-Turret-016__/graphics/entity/circuit-connector/circuit-connector-main.png",
			priority = "low",
			width = 28,
			height = 27,
			x = 28*(connectorNumber%8),
			y = 27*(math.floor(connectorNumber/8)),
			shift = {0 + mainOffset[1], 0.015625 + mainOffset[2]},
		},
		led_red =
		{
			filename = "__Additional-Turret-016__/graphics/entity/circuit-connector/circuit-connector-led-red.png",
			priority = "low",
			width = 20,
			height = 16,
			x = 20*(connectorNumber%8),
			y = 16*(math.floor(connectorNumber/8)),
			shift = {0 + mainOffset[1], -0.03125 + mainOffset[2]},
		},
		led_green =
		{
			filename = "__Additional-Turret-016__/graphics/entity/circuit-connector/circuit-connector-led-green.png",
			priority = "low",
			width = 20,
			height = 16,
			x = 20*(connectorNumber%8),
			y = 16*(math.floor(connectorNumber/8)),
			shift = {0 + mainOffset[1], -0.03125 + mainOffset[2]},
		},
		led_blue =
		{
			filename = "__Additional-Turret-016__/graphics/entity/circuit-connector/circuit-connector-led-blue.png",
			priority = "low",
			width = 21,
			height = 22,
			x = 21*(connectorNumber%8),
			y = 22*(math.floor(connectorNumber/8)),
			shift = {-0.015625 + mainOffset[1], 0 + mainOffset[2]},
		},
		
		logistic_animation = 
		{
			filename = "__Additional-Turret-016__/graphics/entity/circuit-connector/circuit-connector-logistic-animation.png",
			priority = "low",
			blend_mode = "additive",
			line_length = 4,
			width = 43,
			height = 43,
			frame_count = 15,
			shift = {0.015625 + logisticAnimationOffsets[connectorNumber+1][1] + mainOffset[1], -0.234375 + logisticAnimationOffsets[connectorNumber+1][2] + mainOffset[2]},
		},
		
		led_light =
		{
			intensity = 0.8,
			size = 0.9,
		},
		
		blue_led_light_offset = {0 + mainOffset[1], -0.03125 + mainOffset[2]},
		red_green_led_light_offset = {0 + mainOffset[1], -0.15625 + mainOffset[2]},
	};
	
	if (not (shadowOffset == nil)) then
		result.connector_shadow =
		{
			filename = "__Additional-Turret-016__/graphics/entity/circuit-connector/circuit-connector-shadow.png",
			priority = "low",
			width = 34,
			height = 26,
			x = 34*(connectorNumber%8),
			y = 26*(math.floor(connectorNumber/8)),
			shift = {0.125 + shadowOffset[1], 0.09375 + shadowOffset[2]},
		};
	end
	return result;
end

data:extend({
-- fluid
{
	type = "fluid",
	name = "piranha-solution",
	default_temperature = 25,
	heat_capacity = "1KJ",
	base_color = {r=0, g=0.4, b=0.2},
	flow_color = {r=0, g=0.5, b=0.3},
	max_temperature = 100,
	icon = "__Additional-Turret-016__/graphics/icon/piranha-solution-icon.png",
	icon_size = 32,
	pressure_to_speed_ratio = 0.4,
	flow_to_energy_ratio = 0.59,
	order = "a[fluid]-g[piranha-solution]"
},
{
	type = "item",
	name = "piranha-core",
	icon = "__Additional-Turret-016__/graphics/icon/piranha-core-icon.png",
	icon_size = 32,
	flags = {"goes-to-main-inventory"},
	subgroup = "intermediate-product",
	order = "g[plastic-bar]-a[piranha-core]",
	stack_size = 10
},

-- corpse
{
	type = "corpse",
	name = "at-scorchmark",
	icon = "__Additional-Turret-016__/graphics/icon/test.png",
	icon_size = 32,
	flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
	collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
	collision_mask = {"doodad-layer", "not-colliding-with-itself"},
	selection_box = {{-1, -1}, {1, 1}},
	selectable_in_game = false,
	time_before_removed = 60 * 60 * 10, -- 10 minutes
	final_render_layer = "ground-patch-higher2",
	subgroup = "remnants",
	order="d[remnants]-b[scorchmark]-b[at-scorchmark]",
	ground_patch =
	{
		sheet =
		{
			width = 400,
			height = 368,
			frame_count = 1,
			direction_count = 1,
			filename = "__Additional-Turret-016__/graphics/crater.png",
			variation_count = 1
		}
	},
	ground_patch_higher =
	{
		sheet =
		{
			width = 400,
			height = 368,
			frame_count = 1,
			direction_count = 1,
			filename = "__Additional-Turret-016__/graphics/crater.png",
			variation_count = 1
		}
	}
},

-- category
{
	type = "ammo-category",
	name = "artillery-mk1-shell"
},
{
	type = "ammo-category",
	name = "artillery-mk2-shell"
},
{
	type = "ammo-category",
	name = "dummy"
},

-- damage type
{
	type = "damage-type",
	name = "sore-acid"
},

-- recipe
{
	type = "recipe",
	name = "piranha-solution",
	category = "chemistry",
	energy_required = 6,
	subgroup = "fluid-recipes",
	enabled = false,
	ingredients =
	{
		{type="item", name="piranha-core", amount=4},
		{type="item", name="stone-brick", amount=5},
		{type="fluid", name="water", amount=50},
	},
	results=
	{
		{type="fluid", name="piranha-solution", amount=40},
	},
},
{
	type = "recipe",
	name = "piranha-core",
	category = "chemistry",	
	energy_required = 10,
	subgroup = "intermediate-product",
	order = "i[explosives]-a[piranha-core]",
	enabled = false,
	icon = "__Additional-Turret-016__/graphics/icon/piranha-core-icon.png",
	icon_size = 32,
	ingredients =
	{
		{type="item", name="sulfur", amount=30},
		{type="item", name="coal", amount=3},
		{type="item", name="stone", amount=5},
		{type="fluid", name="water", amount=5},
		{type="fluid", name="sulfuric-acid", amount=1}
	},
	results=
	{
		{type="fluid", name="petroleum-gas", amount=3},
		{type="item", name="piranha-core", amount=6},
	},
},
})

-- fire sound
function fire_sound(inputs)
return
{
	type = "explosion",
	name = inputs.name,
	flags = {"not-on-map"},
	animations =
	{
		{
			filename = "__Additional-Turret-016__/graphics/blank.png",
			priority = "low",
			width = 1,
			height = 1,
			frame_count = 1,
			line_length = 1,
			animation_speed = 1
		},
	},
	light = {intensity = 0, size = 0},
	sound =
	{
		{
			filename = inputs.filename,
			volume = inputs.volume,
		},
	},
}
end

data:extend({
fire_sound{name = "at_Artillery_shoot_sound", filename = "__Additional-Turret-016__/sound/Artillery_shoot_sound.ogg", volume = 1.0},
fire_sound{name = "at_LC_turret_sound", filename = "__Additional-Turret-016__/sound/LC_turret_sound.ogg", volume = 1.0},
fire_sound{name = "at_CR_turret_sound", filename = "__Additional-Turret-016__/sound/cannon_3_sound.ogg", volume = 1.0},
fire_sound{name = "capsule_sound", filename = "__Additional-Turret-016__/sound/uplink.ogg", volume = 1.0},
})