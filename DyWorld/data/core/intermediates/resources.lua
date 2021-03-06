require "data/prefix"

local Data_Table = {
	{
		Name = "chromium",
		Table = "Chromium",
		Type = 1,
		Mining_Hardness = Materials.Chromium.Hardness,
		Mining_Time = (Materials.Chromium.Hardness / Materials.Chromium.Density),
		Tint = Material_Colors.Chromium,
	},
	{
		Name = "gold",
		Table = "Gold",
		Type = 2,
		Mining_Hardness = Materials.Gold.Hardness,
		Mining_Time = (Materials.Gold.Hardness / Materials.Gold.Density),
		Tint = Material_Colors.Gold,
	},
	{
		Name = "lead",
		Table = "Lead",
		Type = 1,
		Mining_Hardness = Materials.Lead.Hardness,
		Mining_Time = (Materials.Lead.Hardness / Materials.Lead.Density),
		Tint = Material_Colors.Lead,
	},
	{
		Name = "tin",
		Table = "Tin",
		Type = 1,
		Mining_Hardness = Materials.Tin.Hardness,
		Mining_Time = (Materials.Tin.Hardness / Materials.Tin.Density),
		Tint = Material_Colors.Tin,
	},
	{
		Name = "silver",
		Table = "Silver",
		Type = 2,
		Mining_Hardness = Materials.Silver.Hardness,
		Mining_Time = (Materials.Silver.Hardness / Materials.Silver.Density),
		Tint = Material_Colors.Silver,
	},
	{
		Name = "tungsten",
		Table = "Tungsten",
		Type = 3,
		Mining_Hardness = Materials.Tungsten.Hardness,
		Mining_Time = (Materials.Tungsten.Hardness / Materials.Tungsten.Density),
		Tint = Material_Colors.Tungsten,
	},
	{
		Name = "zinc",
		Table = "Zinc",
		Type = 1,
		Mining_Hardness = Materials.Zinc.Hardness,
		Mining_Time = (Materials.Zinc.Hardness / Materials.Zinc.Density),
		Tint = Material_Colors.Zinc,
	},
	{
		Name = "aluminium",
		Table = "Aluminium",
		Type = 3,
		Mining_Hardness = Materials.Aluminium.Hardness,
		Mining_Time = (Materials.Aluminium.Hardness / Materials.Aluminium.Density),
		Tint = Material_Colors.Aluminium,
	},
	{
		Name = "nickel",
		Table = "Nickel",
		Type = 1,
		Mining_Hardness = Materials.Nickel.Hardness,
		Mining_Time = (Materials.Nickel.Hardness / Materials.Nickel.Density),
		Tint = Material_Colors.Nickel,
	},
}

for k,v in pairs(Data_Table) do
data:extend(
	{
		DyWorld_Noise_Layer(v),
		DyWorld_Autoplace(v),
		DyWorld_Item_Ore(v),
		DyWorld_Resource(v),
		DyWorld_Item_Plate(v),
		DyWorld_Recipe_Plate(v),
	}
	)
end

local function DyWorld_Technology_1(DATA)
  local result =
  {
    type = "technology",
    name = dy..DATA.Name.."-processing",
	localised_name = {"looped-name.processing", {"looped-name."..DATA.Name}},
	icons = data.raw.item[DATA.Name.."-plate"].icons,
    effects =
    {
	  {type = "unlock-recipe", recipe = DATA.Name.."-plate"},
    },
    prerequisites = {"steel-processing"},
    unit =
    {
      count = math.floor(50 * DATA.Mining_Hardness),
      ingredients =
      {
		{"science-pack-1", 1},
      },
      time = 15
    },
    upgrade = true,
    order = dy..DATA.Name.."-processing",
  }
  return result
end

for k,v in pairs(Data_Table) do
data:extend(
	{
		DyWorld_Technology_1(v),
	})
end

data.raw.resource["tin-ore"].autoplace.richness_base = 4500
data.raw.resource["tin-ore"].autoplace.starting_area_amount = 4500

data.raw.resource["lead-ore"].autoplace.richness_base = 4000
data.raw.resource["lead-ore"].autoplace.starting_area_amount = 4000

data.raw.resource["tungsten-ore"].minable.fluid_amount = 10
data.raw.resource["tungsten-ore"].minable.required_fluid = dy.."hydrogen"