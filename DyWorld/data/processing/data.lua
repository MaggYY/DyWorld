
require("data.processing.edits.recipes")

require("data.processing.assembling.electric")









require("data.processing.recipes")

local Remove_Table = {"assembling-machine-1", "assembling-machine-2", "assembling-machine-3"}

for k,m in pairs(Remove_Table) do
	for j,n in pairs(data.raw.technology) do
		if n.effects then
			for h,b in pairs(n.effects) do
				if b.recipe == m then
					table.remove(n.effects, h)
				end
			end
		end
	end
	if data.raw.recipe[m] then
		if data.raw.recipe[m].normal then
			data.raw.recipe[m].normal.hidden = true
			data.raw.recipe[m].expensive.hidden = true
		else
			data.raw.recipe[m].hidden = true
		end
	end
end