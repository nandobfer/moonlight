local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ROOTS)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EXPLOSION)
-- combat:setArea(createCombatArea(AREA_SQUARE1X1))

function onTargetCreature(creature, target)
	return doChallengeCreature(creature, target)
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:name("Growl")
spell:words("exeta raawl")
spell:group("support")
spell:vocation("druid;true", "elder druid;true")
spell:id(93)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(20)
spell:mana(0)
spell:isAggressive(false)
spell:needCasterTargetOrDirection(true)
spell:isPremium(true)
Spell:needLearn(false)
spell:register()
