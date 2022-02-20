local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	local player = creature:getPlayer()
	if player:getItemCount(2544) > 0 and player:getItemCount(2177) > 0 then -- busca 5 arrow e 1 life crystal
		player:removeItem(2544, 5) -- remove 5 arrow
		return creature:conjureItem(2177, 18304, 5, CONST_ME_MAGIC_GREEN) -- transforma life crystal em crystalline arrow
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		--creature:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
		"Para criar 5 flechas de cristal, voce precisa ter 5 flechas e um cristal da vida! ")
		return false
	end
end

spell:name("Make Crystaline Arrow")
spell:words("exeta crys con")
spell:group("support")
spell:vocation("hunter;true")
spell:id(110)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(90)
spell:mana(60)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()

--2544 arrow
--18304 crystal arrow 5 x 1 2177: life crystal *
--29057 diamond arrow 1 x 1 37605: diamond
--7850 earth arrow 10 x 1 11222: lump of earth
--7840 flaming arrow 10 x 1 8748: coal
--7838 flash arrow 
--2545 poison arrow
--2546 burst arrow
--