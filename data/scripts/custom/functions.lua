-- ajusta mana fixa pras vocações de energia
function Player:ajustarMana()
	local player = self:getPlayer()
	local energy_class = {
		assassin = 9,
		hunter = 11,
		knight = 4
	}
	for _, value in ipairs (energy_class) do
		if value == player:getVocation():getVocationId() then
		player:setMaxMana(100)
		return true
		else end
	end
end

-- checa se a posição é andável
function isWalkable(pos)
	local tile = Tile(pos)
	if not tile or not tile:getGround() and not tile:hasFlag(TILESTATE_IMMOVABLEBLOCKSOLID or TILESTATE_BLOCKSOLID) then
		return false
	else 
		if tile and tile:getGround() and not tile:hasFlag(bit.bor(TILESTATE_IMMOVABLEBLOCKSOLID)) and not tile:getTopCreature() then
			return true
		else end
	end
end


-- //////////////////////////////////////////////// ASSASSIN ///////////////////////////////////////////////

	-- Checar Combo Points
function Player:getComboPoints()
	return self:getStorageValue(Storage_.combo_points)
end

	-- Gerador de combo points, ASSASSIN
function Player:addComboPoints(cp)
	if (self:getStorageValue(Storage_.combo_points) < 0) then -- se a storage for -1
		self:setStorageValue(Storage_.combo_points, 1) -- seta 1
		self:say("Combo Points: " .. self:getStorageValue(Storage_.combo_points) .. ".", TALKTYPE_MONSTER_SAY)
		-- self:setMaxMana(getStorageValue(Storage_.combo_points))
	elseif (self:getStorageValue(Storage_.combo_points) < 5) then -- se a storage/cp for menor que 5
		-- local cp = self:getStorageValue(Storage_.combo_points) + 1 -- ganha 1 cp
		self:setStorageValue(Storage_.combo_points, self:getStorageValue(Storage_.combo_points) + cp) -- salva o cp atual na storage
		self:say("Combo Points: " .. self:getStorageValue(Storage_.combo_points) .. " ", TALKTYPE_MONSTER_SAY)
		-- self:setMaxMana(cp)
	else
		self:say("Combo Points: " .. self:getStorageValue(Storage_.combo_points) .. " ", TALKTYPE_MONSTER_SAY)
	end
end

	-- Zerar combo points
function Player:removeComboPoints()
	self:setStorageValue(Storage_.combo_points, 0) -- volta pra 0
	self:setStorageValue(Storage_.bonus_combo_points, 0)
	self:say("Combo Points:" .. self:getStorageValue(Storage_.combo_points) .. ".", TALKTYPE_MONSTER_SAY)
	-- self:say("Combo Points:" .. self:getStorageValue(Storage_.combo_points) .. ".", TALKTYPE_MONSTER_SAY)
end

-- Checar Storage_.stealth
function Player:getStealth()
	if (self:getStorageValue(Storage_.stealth) == 1) then
		return true
	else
		return false
	end
end

-- Remover invisibilidade, caso estiver
function Player:removeStealth()
	if (self:getStorageValue(Storage_.stealth) == 1) then
		self:setStorageValue(Storage_.stealth, 0)
		local isGhost = not self:isInGhostMode()
		self:setGhostMode(isGhost)
		self:sendTextMessage(MESSAGE_HOTKEY_PRESSED, "You are visible again.")
		self:removeCondition(CONDITION_INVISIBLE)
		self:getPosition():sendMagicEffect(CONST_ME_SMOKE)
	else end
end

	-- Verifica armas de assassino (retorna true caso esteja usando só 1 arma de uma mão)
function Player:getSinWeapons()
	local leftItem = self:getSlotItem(CONST_SLOT_LEFT) -- salva o item equipado na variavel
	local rightItem = self:getSlotItem(CONST_SLOT_RIGHT) -- salva o item equipado na variavel
	if leftItem then
		local item = ItemType(leftItem.itemid) -- pega o tipo do item equipado a partir de seu id
		local slot = item:getSlotPosition() -- two handed retorna 2096, one handed retorna 48
		if self:getSlotItem(CONST_SLOT_RIGHT) or (slot == 2096) then
			self:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
			self:sendTextMessage(MESSAGE_EVENT_ADVANCE,
			"Voce nao consegue fazer isso se estiver empunhando um escudo ou uma arma de duas maos!")
			return false
		else
			return true
		end
	else 
		return true
	end
end

	-- Aplica veneno de 15 segundos
function applyPoison(player, combat, mod)
	local level = player:getLevel()
	local ml = player:getMagicLevel()
	local condition = Condition(CONDITION_POISON)
	condition:setParameter(CONDITION_PARAM_DELAYED, 1)
	condition:addDamage(3, 1000, -((level / 2) + (2 * ml))* mod)
	condition:addDamage(6, 1000, -((level / 2) + (2 * ml)) * 2 / 3 * mod)
	condition:addDamage(6, 1000, -((level / 2) + (2 * ml)) / 3 * mod)
	combat:addCondition(condition)
end





-- //////////////////////////////////////////////// PALADIN ///////////////////////////////////////////////

	--Gerar poder sagrado
function Player:addPoderSagrado()
	if self:getStorageValue(Storage_.holy_power) < 1 then
		self:setStorageValue(Storage_.holy_power, 1)
		self:say("Poder Sagrado: " .. self:getStorageValue(Storage_.holy_power) .. "/3", TALKTYPE_MONSTER_SAY)
	elseif (self:getStorageValue(Storage_.holy_power) < 3) then -- se a Storage_.holy_power for menor que 3
		local hp = self:getStorageValue(Storage_.holy_power) + 1 -- ganha 1 hp
		self:setStorageValue(Storage_.holy_power, hp) -- salva o hp atual na storage
		self:say("Poder Sagrado: " .. hp .. "/3", TALKTYPE_MONSTER_SAY)
	else
		self:say("Poder Sagrado: " .. self:getStorageValue(Storage_.holy_power) .. "/3", TALKTYPE_MONSTER_SAY)
	end
end

	-- Checar poder sagrado
function Player:getPoderSagrado()
	return self:getStorageValue(Storage_.holy_power)
end

	-- Zerar poder sagrado
function Player:removePoderSagrado()
	self:setStorageValue(Storage_.holy_power, 0) -- volta pra 0
	self:say("Poder Sagrado: " .. self:getStorageValue(Storage_.holy_power) .. "/3", TALKTYPE_MONSTER_SAY)
end





-- //////////////////////////////////////////////// DRUIDA ///////////////////////////////////////////////

function Player:getFreeHands()
	local player = self:getPlayer()
	local leftItem = player:getSlotItem(CONST_SLOT_LEFT) -- salva o item equipado na variavel
	local rightItem = player:getSlotItem(CONST_SLOT_RIGHT) -- salva o item equipado na variavel
	
	if leftItem or rightItem then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
			"Voce nao consegue fazer isso se estiver empunhando algo nas maos!")
		return false
	else
		return true
	end
end

	-- Retorna metamorfose
function Player:getForm()
	if self:getStorageValue(Storage_.bear_form) == 1 then
		return "bear"
	elseif self:getStorageValue(Storage_.feral_form) == 1 then
		return "feral"
	elseif self:getStorageValue(Storage_.plant_form) == 1 then
		return "plant"
	else
		return false
	end
end

	-- Destransformar
function Player:removeForm()
	self:setStorageValue(Storage_.metamorfose, 0) -- Storage_.metamorfose geral
	if self:getForm() == "bear" or self:getForm() == "plant" then
		if self:getForm() == "bear" then
			self:setStorageValue(Storage_.bear_form, 0) -- bear
		else
			self:setStorageValue(Storage_.plant_form, 0) -- plant
		end
		--MAX HP MOD--
		self:setStorageValue(recover_life, self:getHealth() / self:getMaxHealth() * 100)
		self:setMaxHealth(self:getMaxHealth() - self:getStorageValue(Storage_.bear_bonus_life)) -- define HP como o atual transformado - o que ele ganhou quando transformou
		self:setStorageValue(Storage_.bear_bonus_life, 0)
		self:setHealth(self:getStorageValue(recover_life) * self:getMaxHealth() / 100)
		--LIFE REGEN--
		self:removeCondition(CONDITION_REGENERATION)
		--MAX MANA MOD--
		self:setMaxMana(self:getMaxMana() + self:getStorageValue(Storage_.max_mana))
		self:addMana(self:getStorageValue(Storage_.recover_mana) * self:getMaxMana() / 100)
	elseif self:getForm() == "feral" then
		self:setStorageValue(Storage_.feral_form, 0) -- feral
		--FERAL MODS--
		self:removeCondition(CONDITION_HASTE)
		--MAX MANA MOD--
		self:setMaxMana(self:getMaxMana() + self:getStorageValue(Storage_.max_mana))
		self:addMana(self:getStorageValue(Storage_.recover_mana) * self:getMaxMana() / 100)
	end
--FIST SKILL--
	self:removeCondition(CONDITION_ATTRIBUTES)
		
--OUTFIT--
	self:removeCondition(CONDITION_OUTFIT)
		
end

	-- Metamorfose: transforma em werebear ou werewolf
function Player:addForm(form, skill)
	local player = self:getPlayer()
	local change_outfit = Condition(CONDITION_OUTFIT)
	local skill_bonus = Condition(CONDITION_ATTRIBUTES)
	skill_bonus:setTicks(-1)
	change_outfit:setTicks(-1)
	player:setStorageValue(Storage_.metamorfose, 1)
	
	-- Desequipa armas
	local leftItem = player:getSlotItem(CONST_SLOT_LEFT)
	local rightItem = player:getSlotItem(CONST_SLOT_RIGHT)
	local container = player:getSlotItem(CONST_SLOT_BACKPACK)
	if leftItem then
		if container then
			leftItem:moveTo(container)
		else
			player:addItem(leftItem.itemid)
			player:removeItem(leftItem.itemid, 1, -1, false) -- itemid, count, subtype, ignore equiped
		end
	else end
	if rightItem then
		if container then
			rightItem:moveTo(container)
		else
			player:addItem(rightItem.itemid)
			player:removeItem(rightItem.itemid, 1, -1, false) -- itemid, count, subtype, ignore equiped
		end
	else end
	
	
	--FIST SKILL--
	skill_bonus:setParameter(CONDITION_PARAM_SKILL_FISTPERCENT, skill)
	player:addCondition(skill_bonus)
	
	--MAX MANA MOD--
	player:setStorageValue(Storage_.max_mana, player:getMaxMana()) --salva mana maxima na storage
	player:setStorageValue(Storage_.recover_mana, player:getMana() / player:getMaxMana() * 100)
	player:setMaxMana(0) -- zera a mana máxima
	
	--change_outfit--
	--player:setStorageValue(Storage_.bear_form, player:getOutfit().lookType)
	--player:setOutfit({lookType = 720})
	change_outfit:setOutfit(MonsterType(form):getOutfit())
	player:addCondition(change_outfit)
	
	if form == "werebear" or form == "Leaf Golem" then
		if form == "werebear" then
			player:setStorageValue(Storage_.bear_form, 1) -- bear
		else
			player:setStorageValue(Storage_.plant_form, 1) -- plant
			addEvent(function()
				player:removeForm()
			end, 1000 * 15)
		end
		local bear_regen = Condition(CONDITION_REGENERATION)
		bear_regen:setTicks(-1)
		bear_regen:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
		--MAX HP MOD--
		player:setStorageValue(Storage_.bear_bonus_life, player:getMaxHealth() * 2) --salva hp bonus na storage
		player:setStorageValue(recover_life, player:getHealth() / player:getMaxHealth() * 100)
		player:setMaxHealth(player:getMaxHealth() * 3) -- add hp bonus
		player:setHealth(player:getStorageValue(recover_life) * player:getMaxHealth() / 100)
		
		--LIFE REGEN--
		bear_regen:setParameter(CONDITION_PARAM_HEALTHGAIN, player:getMaxHealth() * 0.1)
		bear_regen:setParameter(CONDITION_PARAM_HEALTHTICKS, 5 * 1000)
		player:addCondition(bear_regen)
		
	-- elseif form == "Midnight Panther" then
	else
		player:setStorageValue(Storage_.feral_form, 1) -- wolf
		local feral_speed = Condition(CONDITION_HASTE)
		feral_speed:setParameter(CONDITION_PARAM_TICKS, -1)
		feral_speed:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
		feral_speed:setFormula(0.7, -56, 0.7, -56)
		player:addCondition(feral_speed)
	end
end

-- //////////////////////////////////////////////// SORCERER ///////////////////////////////////////////////

function tryElementalOverload(combat, creature, var)
	-- local player = self:getPlayer()
	-- if player:getStorageValue(Storage_.elemental_overload) == 1 then
	if math.random(1, 100) <= 15 then
		creature:say("ELEMENTAL OVERLOAD!", TALKTYPE_MONSTER_YELL) 
		local mana_regen = Condition(CONDITION_REGENERATION)
		mana_regen:setTicks(5 * 1000)
		mana_regen:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
		mana_regen:setParameter(CONDITION_PARAM_MANAGAIN, 6)
		mana_regen:setParameter(CONDITION_PARAM_MANATICKS, 2 * 1000)
		creature:addCondition(mana_regen)
		
		addEvent(function()
			combat:execute(creature, var)
		end, 0.75 * 1000)
		addEvent(function()
			combat:execute(creature, var)
		end, 1.5 * 1000)
		addEvent(function()
			combat:execute(creature, var)
		end, 2.25 * 1000)
	else end
	-- else
end

-- //////////////////////////////////////////////// KNIGHT ///////////////////////////////////////////////

function Player:getBloodRage()
	local player = self:getPlayer()
	if player:getStorageValue(Storage_.blood_rage) == 1 then
		return true
	else
		return false
	end
end

-- //////////////////////////////////////////////// HUNTER ///////////////////////////////////////////////

function Player:getLoneWolf()
	local player = self:getPlayer()
	if player:getStorageValue(Storage_.lone_wolf) == 1 then
		return true
	else
		return false
	end
end