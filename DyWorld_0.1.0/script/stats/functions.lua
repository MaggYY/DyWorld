module("stats_functions", package.seeall)
require "roadmap"

function IncrementerGlobal(NAME, AMOUNT, ITEMNAME)
	local ITEMNAME2 = ITEMNAME or "nil"
	if not global.stats[NAME] then 
		global.stats[NAME] = AMOUNT 
		--debug("Created "..NAME.." counter for "..ITEMNAME2.." with : "..AMOUNT.."")
	else
		global.stats[NAME] = global.stats[NAME] + AMOUNT
		--debug("Added to "..NAME.." counter for "..ITEMNAME2.." with : "..AMOUNT.."")
	end
end

function IncrementerPersonal(NAME, AMOUNT, ID, ITEMNAME)
	local ITEMNAME2 = ITEMNAME or "nil"
	if not global.players[ID].stats[NAME] then 
		global.players[ID].stats[NAME] = AMOUNT 
		--debug("Created "..NAME.." counter for "..ITEMNAME2.." with : "..AMOUNT.." for player "..ID.."")
	else
		global.players[ID].stats[NAME] = global.players[ID].stats[NAME] + AMOUNT
		--debug("Added to "..NAME.." counter for "..ITEMNAME2.." with : "..AMOUNT.." for player "..ID.."")
	end
end

function BodySkills(id)
	local mp = global.dyworld.Players
	local gsc = global.players[id].stats.crafted or 1
	local gsm = global.players[id].stats.mined or 1
	local gsb = global.players[id].stats.build or 1
	local gsp = global.players[id].stats.pickup or 1
	local gsk = global.stats.killed or 1
	local gss = global.stats.scanned or 1
	local gsr = global.stats.research or 1
	local gsgb = global.stats.ghostbuild or 1
	local gsgm = global.stats.ghostmined or 1
	local p1 = global.players[id].physical.strength
	local p2 = global.players[id].physical.endurance
	local p3 = global.players[id].physical.speed
	local p4 = global.players[id].physical.creations
	local p5 = global.players[id].physical.implants 
	local m1 = global.players[id].mystical.spirit
	local m2 = global.players[id].mystical.intelligence
	local m3 = global.players[id].mystical.wisdom
	local m4 = global.players[id].mystical.guile
	local m5 = global.players[id].mystical.knowledge
	-- p5 is done with research and crafting! implants will be installed, each with a base number to increase the value
	global.players[id].physical.creations = math.floor(((gsb+gsc)+(gsgb/25))/(1000*mp))
	global.players[id].mystical.guile = math.floor(((((gsc+gsm)/25)+((gsb+(gsgb/100))/50)+gsk)/(1000*mp))+1)
	global.players[id].mystical.intelligence = math.floor(((((p4+m4)*5)+gss)/(1000*mp))+1)
	global.players[id].physical.endurance = math.floor((((gsc/25)+(gsm/25)+(gsb/5)+(gsk)+(p5*50)+(gsp/50))/(1000*mp))+1)
	global.players[id].physical.strength = math.floor((((gsm)+(gsb/5)+(gsc/25)+(p5*75)+(p2*100)+(m2*25)+(gsp/50))/(1000*mp))+1)
	global.players[id].mystical.spirit = math.floor((((p1*35)+((gsgb+gsgm)/5)+(gsk/25)+gss)/(1000*mp))+1)
	global.players[id].physical.speed = math.floor((((p1*25)+(p2*50)+(m1*10))/(1000*mp))+1)
	global.players[id].mystical.wisdom = math.floor(((((m1+m2+m4)*25)+((gsc+gsm+gsb+gsk+gss+gsgb+gsgm)/25))/(1000*mp))+1)
	global.players[id].mystical.knowledge = math.floor((((m1*5)+(m2*50)+(m3*40)+(m4*10)+(gsr))/(1000*mp))+1)
	game.players[id].character_health_bonus = math.floor(100+((p1*5)+(p2*2)+(m1*5)+p3)) -- testing now!
end