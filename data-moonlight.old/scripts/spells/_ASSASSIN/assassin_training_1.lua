local spell = Spell("instant")

local config = {
	add = 5
}

function spell.onCastSpell(creature, variant)
	player = creature:getPlayer()
	
	if player:getStorageValue(Storage_.training_sin.i) < 0 then
		local new_crit = player:getStorageValue(Storage_.crit.chance) + config.add
		player:setStorageValue(Storage_.crit.chance, new_crit)
		player:removeCondition(CONDITION_ATTRIBUTES)
		player:setBaseCritical()
		player:say("Voce se tornou um aprendiz de assassino!", TALKTYPE_MONSTER_YELL)
		player:setStorageValue(Storage_.training_sin.i, 1)
	end
	return true
end

spell:name("Treinamento de assassino I")
spell:words("traini sin i")
spell:group("support")
spell:vocation("assassin;true")
spell:id(81)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(10)
spell:mana(0)
spell:hasParams(false)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()