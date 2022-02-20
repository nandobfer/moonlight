local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 2) + (maglevel * 1.5) + 4
	local max = (level / 2) + (maglevel * 2) + 12
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	tryElementalOverload(combat, creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(19)
spell:name("Fire Wave")
spell:words("exevo flam hur")
spell:level(18)
spell:mana(40)
spell:isPremium(true)
spell:range(7)
spell:needTarget(true)
spell:cooldown(4 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()