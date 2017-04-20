require "data/prefix"

Recipe_T2_Tech = {"boiler", "steam-engine", "electric-mining-drill", "electronic-circuit", "inserter", "offshore-pump", "pipe", "pipe-to-ground", "small-electric-pole", "assembling-machine-1", "repair-pack", "transport-belt", "science-pack-1", "science-pack-2", "pistol", "stone-furnace", "iron-gear-wheel", "iron-stick", "burner-inserter", "copper-cable", "burner-mining-drill"}
Recipe_T3_Tech = {"radar"}

for k,v in pairs(Recipe_T2_Tech) do
	if data.raw["recipe"][v].enabled then
		data.raw["recipe"][v].enabled = false
	else
		data.raw["recipe"][v].enabled = false
	end
	local result = {type = "unlock-recipe", recipe = v}
	table.insert(data.raw.technology[dyworld_prefix.."tech-"..basic].effects, result)
end	

for k,v in pairs(Recipe_T3_Tech) do
	if data.raw["recipe"][v].enabled then
		data.raw["recipe"][v].enabled = false
	else
		data.raw["recipe"][v].enabled = false
	end
	local result = {type = "unlock-recipe", recipe = v}
	table.insert(data.raw.technology[dyworld_prefix.."tech-"..intermediate].effects, result)
end