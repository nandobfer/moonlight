local spell = Spell("instant")

function spell.onCastSpell(player, variant)
	local position = player:getPosition()
	local monsterName = "Summoned Undead Dragon"
	local monsterType = MonsterType(monsterName)

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
			player:sendCancelMessage("Voce nao consegue sumonar o Undead Dragon se tiver outros summons.")
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
	player:addHealth(-(player:getMaxHealth() * 0.9)) -- custa 90% da vida do usuario
	return true
end

spell:group("support")
spell:id(9)
spell:name("Summon Undead Dragon")
spell:words("utevo dragon")
spell:level(250)
spell:mana(12000)
spell:hasParams(true)
spell:cooldown(60 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("necromancer;true")
spell:register()