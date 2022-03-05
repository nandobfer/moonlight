local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	player = creature:getPlayer()
	
	if player:getStorageValue(Storage_.training_sin.master_poisoner) < 0 then
		player:say("Voce dominou a manipulacao de venenos!!", TALKTYPE_MONSTER_YELL)
		player:setStorageValue(Storage_.training_sin.master_poisoner, 1)
	end
	return true
end

spell:name("Mestre Envenenador")
spell:words("traini sin tera")
spell:group("support")
spell:vocation("assassin;true")
spell:id(81)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(18)
spell:mana(0)
spell:hasParams(false)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()