-- Class chooser startup
function classStartUp(player)
	local class = player:getVocation():getName()
	
	if class == "Assassin" then
		-- assassinStartUp(player)
	elseif class == "Hunter" then
		-- hunterStartUp(player)
	elseif class == "Knight" then
		-- knightStartUp(player)
	elseif class == "Paladin" then
		paladinStartUp(player)
	
	end
end

function energyRegen(playerid)
	if Creature(playerid) then
		Creature(playerid):addMana(1, false)
		addEvent(energyRegen, 100, playerid)
		return true
	else end
end



-- //////////////////////////////////////////////// ASSASSIN ///////////////////////////////////////////////

function assassinStartUp(player)
	energyRegen(player:getId())
end

-- //////////////////////////////////////////////// PALADIN ///////////////////////////////////////////////

function paladinStartUp(player)
	player:resetAura()
end

-- //////////////////////////////////////////////// DRUIDA ///////////////////////////////////////////////



-- //////////////////////////////////////////////// SORCERER ///////////////////////////////////////////////



-- //////////////////////////////////////////////// KNIGHT ///////////////////////////////////////////////

function knightStartUp(player)
	energyRegen(player:getId())
end

-- //////////////////////////////////////////////// HUNTER ///////////////////////////////////////////////

function hunterStartUp(player)
	energyRegen(player:getId())
end