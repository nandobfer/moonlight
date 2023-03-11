local spell = Spell("instant")

function spell.onCastSpell(creature, var)
		creature:say("Combo Points:" .. creature:getStorageValue(Storage_.combo_points) .. ".", TALKTYPE_MONSTER_SAY)

	return true
end

spell:group("support")
spell:id(142)
spell:name("Combo Points")
spell:words("utevo cp")
spell:level(8)
spell:mana(0)
spell:range(3)
spell:isAggressive(false)
spell:needTarget(false)
spell:cooldown(1 * 1000)
spell:groupCooldown(1 * 1000)
spell:needLearn(false)
spell:vocation("assassin;true")
spell:register()