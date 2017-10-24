require "data/prefix"

local Data_Table = {
	{
		Name = "copper-splitter",
		Icons = {{icon = "__base__/graphics/icons/splitter.png", tint = Material_Colors.Copper}},
		Recipe = true,
		Recipe_Craft_Time = 2,
		Recipe_Result_Count = 2,
		Recipe_Ingredients = {{dy.."copper-transport-belt", 2},{dy.."binding-copper", 8},{"electronic-circuit", 3}},
		Recipe_Without_Tech = false,
		Stack = 200,
		Subgroup = "transport-splitter",
		Order = "copper",
		Item_Place = "quickbar",
		Entity = true,
		Tint = Material_Colors.Copper,
		Item_Per_Sec = DyWorld_Material_Formulas(1, "Copper"),
		Health = DyWorld_Material_Formulas(3, "Copper"),
	},
	{
		Name = "stone-splitter",
		Icons = {{icon = "__base__/graphics/icons/splitter.png", tint = Material_Colors.Stone}},
		Recipe = true,
		Recipe_Craft_Time = 2,
		Recipe_Result_Count = 2,
		Recipe_Ingredients = {{dy.."stone-transport-belt", 2},{dy.."stone-stick", 20},{"electronic-circuit", 2}},
		Recipe_Without_Tech = true,
		Stack = 200,
		Subgroup = "transport-splitter",
		Order = "stone",
		Item_Place = "quickbar",
		Entity = true,
		Tint = Material_Colors.Stone,
		Item_Per_Sec = DyWorld_Material_Formulas(1, "Stone"),
		Health = DyWorld_Material_Formulas(3, "Stone"),
	},
	{
		Name = "wood-splitter",
		Icons = {{icon = "__base__/graphics/icons/splitter.png", tint = Material_Colors.Wood}},
		Recipe = true,
		Recipe_Craft_Time = 2,
		Recipe_Result_Count = 2,
		Recipe_Ingredients = {{dy.."wood-transport-belt", 2},{dy.."wood-stick", 10},{"electronic-circuit", 1}},
		Recipe_Without_Tech = true,
		Stack = 200,
		Subgroup = "transport-splitter",
		Order = "wood",
		Item_Place = "quickbar",
		Entity = true,
		Tint = Material_Colors.Wood,
		Item_Per_Sec = DyWorld_Material_Formulas(1, "Wood"),
		Health = DyWorld_Material_Formulas(3, "Wood"),
	},
}
	
for k,v in pairs(Data_Table) do
	data:extend(
		{
			DyWorld_Entity_Splitter(v),
			DyWorld_Item(v),
			DyWorld_Recipe(v),
		})
end

DyWorld_Add_To_Tech("logistics", dy.."copper-splitter")
DyWorld_Add_To_Tech("logistics", dy.."lead-splitter")
DyWorld_Add_To_Tech("logistics", dy.."silver-splitter")
DyWorld_Add_To_Tech("logistics", dy.."gold-splitter")
DyWorld_Add_To_Tech("logistics", dy.."tin-splitter")
DyWorld_Add_To_Tech("logistics", dy.."chromium-splitter")