local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLCLOUDS)
-- combat:setArea(createCombatArea(AREA_CIRCLE2X2))
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EXPLOSION)

function onTargetCreature(creature, target)
	return doChallengeCreature(creature, target)
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:name("necro summon taunt")
spell:words("###100001")
spell:blockWalls(true)
spell:needLearn(true)
spell:needCasterTargetOrDirection(true)
spell:register()