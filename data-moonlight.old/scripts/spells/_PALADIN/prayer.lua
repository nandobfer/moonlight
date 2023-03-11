local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
combat:setArea(createCombatArea(AREA_SQUARE1X1))

function onTargetCreature(creature, target)
	return doChallengeCreature(creature, target)
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:name("Prayer")
spell:words("exeta pray")
spell:group("support")
spell:vocation("paladin;true", "royal paladin;true")
spell:id(93)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(10)
spell:mana(15)
spell:isAggressive(false)
spell:isPremium(true)
Spell:needLearn(false)
spell:register()
