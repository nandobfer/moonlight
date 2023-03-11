local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)

function onGetFormulaValues(player, level, maglevel)
	return 9999999999
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	creature:getTarget():addHealth(-(creature:getTarget():getMaxHealth()))
	creature:getTarget():getPosition():sendMagicEffect(CONST_ME_YALAHARIGHOST)
	return true
end

spell:group("attack")
spell:id(87)
spell:name("GM Strike")
spell:words("exori gm")
spell:level(10)
spell:mana(100)
spell:isPremium(true)
spell:range(3)
spell:needCasterTargetOrDirection(true)
spell:blockWalls(true)
spell:cooldown(5 * 1000)
spell:groupCooldown(5 * 1000)
spell:needLearn(false)
spell:vocation("none;true")
spell:register()