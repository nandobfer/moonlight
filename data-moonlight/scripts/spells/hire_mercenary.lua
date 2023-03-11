local spell = Spell("instant")

local class = {
	{name = "assassin", id = 9, monster = "Hired Assassin"},
}

function spell.onCastSpell(player, variant)
	local position = player:getPosition()
	-- for index, value in ipairs(class) do
		-- if class[index].id == player:getVocation():getId() then
			-- local monsterName = ""..class[index].monster..""
			-- local monsterType = MonsterType(monsterName)
		-- else end
	-- end
	
	local monsterName = "Hired Assassin"
	local monsterType = MonsterType(monsterName)
	
	if player:getLoneWolf() then
		player:sendCancelMessage("Voce nao pode chamar seus ajudantes enquanto for um lobo solitario.")
		return false
	end

	if not monsterType then
		player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end

	-- if not getPlayerFlagValue(player, PlayerFlag_CanSummonAll) then
		-- if not monsterType:isSummonable() then
			-- player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
			-- position:sendMagicEffect(CONST_ME_POFF)
			-- return false
		-- end

		if #player:getSummons() >= 1 then
			player:sendCancelMessage("Voce ja possui um companheiro.")
			position:sendMagicEffect(CONST_ME_POFF)
			return false
		end
	-- end

	local manaCost = monsterType:getManaCost()
	if player:getMana() < manaCost and not getPlayerFlagValue(player, PlayerFlag_HasInfiniteMana) then
		player:sendCancelMessage(RETURNVALUE_NOTENOUGHMANA)
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end
	
	-- variaveis do pet scaling
	local damage_scaling_value = (player:getLevel() * 5) + 100 -- dano do pet aumenta em 5% por level do hunter
	local damage_scaling = Condition(CONDITION_ATTRIBUTES)
	damage_scaling:setParameter(CONDITION_PARAM_TICKS, -1)
	damage_scaling:setParameter(CONDITION_PARAM_BUFF_DAMAGEDEALT, damage_scaling_value)

	local summon = Game.createMonster(monsterName, position, true, false, player)

	if not summon then
		player:sendCancelMessage(RETURNVALUE_NOTENOUGHROOM)
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end

	player:addMana(-manaCost)
	player:addManaSpent(manaCost)
	position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	summon:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	
	--Vida e buff de dano pro pet, escalando com o Level do Hunter
	summon:addCondition(damage_scaling)
	summon:setMaxHealth(player:getMaxHealth() * 2) -- vida do pet = dobro da vida do hunter
	summon:setHealth(summon:getMaxHealth())
	
	
	return true
end

spell:group("support")
spell:id(9)
spell:name("Contratar Mercenario")
spell:words("utevo hire")
spell:level(8)
spell:mana(0)
spell:hasParams(true)
spell:cooldown(1 * 1000)
spell:groupCooldown(1 * 1000)
spell:needLearn(false)
spell:vocation("assassin;true")
spell:register()