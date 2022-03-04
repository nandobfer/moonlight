local spell = Spell("instant")

function spell.onCastSpell(player, variant)
	local position = player:getPosition()
	local monsterName = "Hati"
	local monster2Name = "Skoll"
	local monsterType = MonsterType(monsterName)
	
	if player:getLoneWolf() then
		player:sendCancelMessage("Voce nao pode chamar seus ajuntos enquanto for um lobo solitario.")
		return false
	end

	if not monsterType then
		player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end

	if #player:getSummons() >= 2 then
		player:sendCancelMessage("Hati e Skoll ja estao com voce.")
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end
	
	-- variaveis do pet scaling
	local damage_scaling_value = (player:getLevel() * 5) + 100 -- dano do pet aumenta em 5% por level do hunter
	local damage_scaling = Condition(CONDITION_ATTRIBUTES)
	damage_scaling:setParameter(CONDITION_PARAM_TICKS, -1)
	damage_scaling:setParameter(CONDITION_PARAM_BUFF_DAMAGEDEALT, damage_scaling_value)
	
	if player:getLevel() < 40 then
		if #player:getSummons() >= 1 then
			player:sendCancelMessage("Hati ja esta com voce.")
			position:sendMagicEffect(CONST_ME_POFF)
			return false
		else
			local summon = Game.createMonster(monsterName, position, true, false, player)
			position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			summon:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			--Vida e buff de dano pro pet, escalando com o Level do Hunter
			summon:addCondition(damage_scaling)
			summon:setMaxHealth(player:getMaxHealth() * 2) -- vida do pet = dobro da vida do hunter
			summon:setHealth(summon:getMaxHealth())
		end
	else end

	
	-- sumona skoll se o hunter for level 40 ou maior
	if player:getLevel() >= 40 then
	local hati = 0
	local skoll = 0
		for _, summon in ipairs(player:getSummons()) do
			if summon:getName() == "Skoll" then
				skoll = 1
			elseif summon:getName() == "Hati" then
				hati = 1
			else end
		end
		if skoll == 0 then
			local summon2 = Game.createMonster(monster2Name, position, true, false, player)
			summon2:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			--Vida e buff de dano pro pet, escalando com o Level do Hunter
			summon2:addCondition(damage_scaling)
			summon2:setMaxHealth(player:getMaxHealth())
			summon2:setHealth(summon2:getMaxHealth())
		else end
		if hati == 0 then
			local summon = Game.createMonster(monsterName, position, true, false, player)
			summon:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			--Vida e buff de dano pro pet, escalando com o Level do Hunter
			summon:addCondition(damage_scaling)
			summon:setMaxHealth(player:getMaxHealth()) -- vida do pet = vida do hunter
			summon:setHealth(summon:getMaxHealth())
		end
	else end
	
	
	return true
end

spell:group("support")
spell:id(9)
spell:name("Chamar Fera Espiritual")
spell:words("utevo spir")
spell:level(8)
spell:mana(0)
spell:hasParams(true)
spell:cooldown(1 * 1000)
spell:groupCooldown(1 * 1000)
spell:needLearn(false)
spell:vocation("hunter;true")
spell:register()