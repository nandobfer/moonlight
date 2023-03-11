local config = {
	flask = 284,
	quantity = 50,
	potion = 7643,
	quant_potions = 5,
}

local spell = Spell("instant")

local success = false

function spell.onCastSpell(creature, variant)
	local player = creature:getPlayer()
	if player:getItemCount(config.flask) >= config.quant_potions then -- busca 5 empty flask
		-- player:removeItem(3588, 5) -- remove 5 blueberries
		if mixFruits(player, config.quantity) then
			player:removeItem(config.flask, config.quant_potions-1) -- remove 4 flasks -- apenas 4 pq a conjuracao remove um \/
			return creature:conjureItem(config.flask, config.potion, config.quant_potions, CONST_ME_MAGIC_GREEN) -- transforma flask em potion
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
			"Para criar " .. config.quant_potions .. " pocoes de vida, voce precisa ter " .. config.quantity .. " frutas! ")
			return false
		end
	else
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		--creature:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
		"Para criar " .. config.quant_potions .. " pocoes de vida voce precisa ter " .. config.quant_potions .. " frascos vazios! ")
		return false
	end
end

spell:name("Ultimate Scarlet Vial")
spell:words("exeta gran max vial")
spell:group("support")
spell:vocation("assassin;true", "hunter;true")
spell:id(110)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(140)
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