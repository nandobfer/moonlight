local spell = Spell("instant")

function spell.onCastSpell(player, variant)
	local position = player:getPosition()
	local monsterName = "Summoned Skeleton"
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

		if #player:getSummons() >= 5 then
			player:sendCancelMessage("You cannot summon more creatures.")
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
	if (player:getLevel() >= 12) then
		local summon2 = Game.createMonster(monsterName, position, true, false, player)
		player:addMana(-manaCost)
		player:addManaSpent(manaCost)
		summon2:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else end
	if (player:getLevel() >= 16) then
		local summon3 = Game.createMonster(monsterName, position, true, false, player)
		player:addMana(-manaCost)
		player:addManaSpent(manaCost)
		summon3:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else end
	if not summon then
		player:sendCancelMessage(RETURNVALUE_NOTENOUGHROOM)
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end

	player:addMana(-manaCost)
	player:addManaSpent(manaCost)
	position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	summon:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

spell:group("support")
spell:id(2000001)
spell:name("Summon Skeletons")
spell:words("utevo skel")
spell:level(8)
spell:mana(60)
spell:hasParams(true)
spell:cooldown(10 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("necromancer;true")
spell:register()