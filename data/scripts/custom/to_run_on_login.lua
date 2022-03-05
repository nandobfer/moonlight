-- Base Critical Chance and Damage -- INSERIR SEMPRE QUE USAR removeCondition(CONDITION_ATTRIBUTES)
function Player:setBaseCritical()
	local player = self:getPlayer()
	
	-- definindo storage inicial para todos
	if player:getStorageValue(Storage_.crit.chance) < 1 or player:getStorageValue(Storage_.crit.bonus) < 1 then
		player:setStorageValue(Storage_.crit.chance, 10)
		player:setStorageValue(Storage_.crit.bonus, 100)
	else end
	
	local critical = {
		chance = player:getStorageValue(Storage_.crit.chance),
		bonus = player:getStorageValue(Storage_.crit.bonus)
	}
	
	local condition = Condition(CONDITION_ATTRIBUTES)
	condition:setParameter(CONDITION_PARAM_SUBID, 1)
	condition:setTicks(-1)
	condition:setParameter(CONDITION_PARAM_SKILL_CRITICAL_HIT_CHANCE, critical.chance)
	condition:setParameter(CONDITION_PARAM_SKILL_CRITICAL_HIT_DAMAGE, critical.bonus)
	player:addCondition(condition)
end

-- Class chooser startup
function classStartUp(player)
	local class = player:getVocation():getName()
	
	if class == "Assassin" then
		-- assassinStartUp(player)
	elseif class == "Hunter" then
		-- hunterStartUp(player)
	elseif class == "Knight" then
		-- knightStartUp(player)
	
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