local config = {
	heal = true,
	save = true,
	effect = true,
	spells = true
}

local advanceSave = CreatureEvent("AdvanceSave")
function advanceSave.onAdvance(player, skill, oldLevel, newLevel)
	if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
		return true
	end

	if config.effect then
		player:getPosition():sendMagicEffect(math.random(CONST_ME_FIREWORK_YELLOW, CONST_ME_FIREWORK_BLUE))
		player:say('LEVEL UP!', TALKTYPE_MONSTER_SAY)
	end

	if config.heal then
		player:addHealth(player:getMaxHealth())
	end

	if config.save then
		player:save()
	end
	
	if config.spells then
		for _, spell in ipairs(player:getInstantSpells()) do
			if spell.level == newLevel then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
			"Voce desbloqueou a habilidade " .. spell.name .. " - " .. spell.words .. " : " .. spell.mana .. "\n Leia seu livro de feiticos para saber mais sobre ela!" )
			end
		end
	end
	return true
end
advanceSave:register()