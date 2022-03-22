-- Base Critical Chance and Damage -- INSERIR SEMPRE QUE USAR removeCondition(CONDITION_ATTRIBUTES)
function Player:setBaseCritical()
	local player = self:getPlayer()
	
	-- definindo storage inicial para todos
	if player:getStorageValue(Storage_.crit.chance) < 1 or player:getStorageValue(Storage_.crit.bonus) < 1 then
		player:setStorageValue(Storage_.crit.chance, 10)
		player:setStorageValue(Storage_.crit.bonus, 100)
	else end

	if player:getStorageValue(Storage_.crit.weapon_chance) < 0 then
		player:setStorageValue(Storage_.crit.weapon_chance, 0)
		player:setStorageValue(Storage_.crit.weapon_bonus, 0)
	end
	
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

	-- caso esteja equipado com a assassin dagger
	--[[ local leftItem = self:getSlotItem(CONST_SLOT_LEFT) -- salva o item equipado na variavel
	if leftItem and leftItem.itemid == 7404 then
		player:setStorageValue(Storage_.crit.bonus, critical.bonus + 50)
		player:setStorageValue(Storage_.crit.chance, critical.chance + 15)
	end ]]
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