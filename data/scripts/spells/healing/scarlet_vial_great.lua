local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	local player = creature:getPlayer()
	if player:getItemCount(3588) >= 25 and player:getItemCount(284) >= 5 then -- busca 25 blueberry e 5 empty flask
		player:removeItem(3588, 25) -- remove 75 blueberry
		player:removeItem(284, 4) -- remove 4 flask
		return creature:conjureItem(284, 239, 5, CONST_ME_MAGIC_GREEN) -- transforma flask em potion
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		--creature:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
		"Para criar uma pocao de vida, voce precisa ter 25 blueberries que vao fermentar e um frasco vazio pra armazenar! ")
		return false
	end
end

spell:name("Great Scarlet Vial")
spell:words("exeta max vial")
spell:group("support")
spell:vocation("assassin;true", "hunter;true")
spell:id(110)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(90)
spell:mana(0)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()

--266 health potion / 285 flask / lvl 10
--236 strong health potion / 283 flask / lvl 50
--239 great health potion / 284 flask / lvl 80
--7643 ultimate health potion / 284 flask / lvl 130
--26031 divine health potion / 284 flask / lvl 200
--3588 blueberry