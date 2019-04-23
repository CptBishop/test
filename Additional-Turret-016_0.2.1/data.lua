require("prototypes.acid")
require("prototypes.others")
-- require("prototypes.wall")


require("prototypes.turret-laser")
require("prototypes.ammo-item")
require("prototypes.ammo-projectiles")
require("prototypes.ammo-recipe")
require("prototypes.technology-item")
require("prototypes.technology-turret")
require("prototypes.technology-turret-upgrade")
-- require("prototypes.technology-wall")
------------------------------

function number_gen(input)
return
{
	type = "sprite",
	name = input.name,
	filename = "__Additional-Turret-016__/graphics/number.png",
	priority = "extra-high-no-scale",
	width = 16,
	height = 25,
	x = input.x,
	y = 0,
}
end

for i = 0, 10 do
	data:extend({ number_gen{name = "number_"..i, x = 16*i} })
end

data:extend({
{
	type = "custom-input",
	name = "at_button_opener",
	key_sequence = "CONTROL + Q",
	consuming = "script-only"
}
})


data.raw["gui-style"].default["at_setting_button_style"] =
{
	type = "button_style",
	parent = "button",
	width = 33,
	height = 33,
	default_graphical_set =
	{
		type = "monolith",
		monolith_image =
		{
			filename = "__Additional-Turret-016__/graphics/button.png",
			priority = "extra-high-no-scale",
			width = 36,
			height = 36,
			x = 0,
			y = 0,
		}
	},
	hovered_graphical_set =
	{
		type = "monolith",
		monolith_image =
		{
			filename = "__Additional-Turret-016__/graphics/button.png",
			priority = "extra-high-no-scale",
			width = 36,
			height = 36,
			x = 0,
			y = 36,
		}
	},
	clicked_graphical_set =
	{
		type = "monolith",
		monolith_image =
		{
			filename = "__Additional-Turret-016__/graphics/button.png",
			width = 36,
			height = 36,
			x = 0,
			y = 72,
		}
	},
	left_click_sound =
	{
		filename = "__core__/sound/gui-click.ogg",
		volume = 1
	},
}

data.raw["gui-style"].default["at_select_style"] =
{
	type = "button_style",
	parent = "button",
	width = 33,
	height = 33,
	default_graphical_set =
	{
		type = "monolith",
		monolith_image =
		{
			filename = "__core__/graphics/gui.png",
			priority = "extra-high-no-scale",
			width = 32,
			height = 32,
			x = 43,
			y = 45,
		}
	},
	hovered_graphical_set =
	{
		type = "monolith",
		monolith_image =
		{
			filename = "__core__/graphics/gui.png",
			priority = "extra-high-no-scale",
			width = 32,
			height = 32,
			x = 111,
			y = 72,
		}
	},
	clicked_graphical_set =
	{
		type = "monolith",
		monolith_image =
		{
			filename = "__core__/graphics/gui.png",
			width = 32,
			height = 32,
			x = 43,
			y = 77,
		}
	},
	left_click_sound =
	{
		filename = "__core__/sound/gui-click.ogg",
		volume = 1
	},
}

data.raw["gui-style"].default["at_selected_style"] =
{
	type = "button_style",
	parent = "button",
	width = 33,
	height = 33,
	default_graphical_set =
	{
		type = "monolith",
		monolith_image =
		{
			filename = "__core__/graphics/gui.png",
			priority = "extra-high-no-scale",
			width = 32,
			height = 32,
			x = 43,
			y = 77,
		}
	},
	hovered_graphical_set =
	{
		type = "monolith",
		monolith_image =
		{
			filename = "__core__/graphics/gui.png",
			priority = "extra-high-no-scale",
			width = 32,
			height = 32,
			x = 111,
			y = 72,
		}
	},
	clicked_graphical_set =
	{
		type = "monolith",
		monolith_image =
		{
			filename = "__core__/graphics/gui.png",
			width = 32,
			height = 32,
			x = 43,
			y = 77,
		}
	},
	left_click_sound =
	{
		filename = "__core__/sound/gui-click.ogg",
		volume = 1
	},
}