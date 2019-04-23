require "config"
require ("libs/list_ammo")

-- local mod_detector = {}
-- mod_detector[1] = 0 -- bob's warfare/enemies
-- mod_detector[2] = 0 -- Predictabowl Enemies

function artillery_area_damage(inputs)
return
{
	type = "area",
	radius = inputs.radius,
	action_delivery =
	{
		type = "instant",
		target_effects =
		{
			{
				type = "damage",
				damage = {amount = inputs.amount, type = "explosion"}
			},
		}
	}
}
end

---------- mod detector
-- for _, tp in pairs(data.raw["damage-type"]) do
	-- if tp.name == "bob-pierce" then
		-- mod_detector[1] = 1
	-- end
-- end
-- for _, tp in pairs(data.raw["unit-spawner"]) do
	-- if tp.name == "evolved-spawner-mix" then
		-- mod_detector[2] = 1
	-- end
-- end

---------- global change
for v, x in pairs(data.raw) do
	for v1, x1 in pairs(x) do
		if x1.resistances then
			local a = {{false}, {0, 0}}
			for v2, x2 in pairs(x1.resistances) do
				if x2.type == "fire" then
					a[2][1] = x2.decrease or 0
					a[2][2] = x2.percent or 0
					a[1][1] = true
				end
			end
			if a[1][1] then
				x1.resistances[#x1.resistances + 1] = { decrease = a[2][1], percent = a[2][2], type = "sore-acid"}
			end
		end
	end
end

---------- selective strain
local damage_modif = 1
for _, tp in pairs(data.raw["unit-spawner"]) do
	if tp.max_health then
		local mh = math.floor(tp.max_health * 0.003 + 0.5)
		
		if damage_modif < mh then damage_modif = mh end
	end
end
for _, x in pairs(data.raw.projectile) do
	if x.name == "artillery-cluster" then
		x.action[#x.action+1] = artillery_area_damage{radius = 5, amount = 100 * damage_modif}
	end
	if x.name == "Artillery_mk1_Ammo" then
		x.action[#x.action+1] = artillery_area_damage{radius = 15, amount = 200 * damage_modif}
	end
	if x.name == "Artillery_mk2_Ammo" then
		x.action[#x.action+1] = artillery_area_damage{radius = 30, amount = 400 * damage_modif}
	end
end
if damage_modif >= 2 then
	local tur_name = {
		elec = {"at-advanced-laser", "at-beam-turret-mk1", "at-beam-turret-mk2"}, 
	}
	-- local projectile_name = {"acid-rocket"}
	-- }
	
	for _, x in pairs(data.raw["electric-turret"]) do
		for i = 1, #tur_name.elec do
			if x.name == tur_name.elec[i] then
				-- x.attack_parameters.damage_modifier = 1 + (damage_modif / 5)
				x.attack_parameters.damage_modifier = x.attack_parameters.damage_modifier * damage_modif * 0.5
			end
		end
	end
	for _, x in pairs(data.raw["ammo-turret"]) do
		for i = 1, #tur_name.ammo do
			if x.name == tur_name.ammo[i] then
				x.attack_parameters.damage_modifier = 1 + (damage_modif / 10)
			end
		end
	end
	-- for _, x in pairs(data.raw["projectile"]) do
		-- for i = 1, #projectile_name.cannon then
			-- if x.name == projectile_name.cannon[i] then
				-- action.action_delivery.target_effects[j or nil].type or damage.amount
			-- end
		-- end
		-- for i = 1, #projectile_name.rocket then
			-- if x.name == projectile_name.rocket[i] then
				
			-- end
		-- end
	-- end
end





---------- acid strain
local fluid_container = {
	{"nitric-acid", 1.5}, {"alien-acid", 3}, --bob
	{"liquid-hydrochloric-acid", 1.5}, {"liquid-hydrofluoric-acid", 1.2}, {"liquid-perchloric-acid", 1.3}, {"liquid-nitric-acid", 1.5}, {"liquid-sulfuric-acid", 1.5} --angel
}
for _, fluid in pairs(data.raw.fluid) do
	for i = 1, #fluid_container do
		if fluid.name == fluid_container[i][1] then
			table.insert(data.raw["fluid-turret"]["at-acidthrower-turret"].attack_parameters.fluids, {type = fluid_container[i][1], damage_modifier = fluid_container[i][2]})
			break
		end
	end
end


---------- Config strain
if Config.enemy_corps_time then
	for v, x in pairs(data.raw.corpse) do
		-- if not string.find(x.name, "remnants") then
		if string.find(x.name, "corpse") or string.find(x.name, "scorchmark") then
			x.time_before_removed = Config.enemy_corps_time
		end
	end
end