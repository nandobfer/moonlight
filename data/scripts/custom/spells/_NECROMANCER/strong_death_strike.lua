local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 4) + 16
	local max = (level / 5) + (maglevel * 5) + 28
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	creature:addHealth(-(creature:getMaxHealth() * 0.25)) -- custa 25% da vida do usuario
	return combat:execute(creature, var)
end

spell:group("attack", "special")
spell:id(152)
spell:name("Strong Death Strike")
spell:words("exori gran mort")
spell:level(50)
spell:mana(300)
spell:isPremium(true)
spell:range(3)
spell:needCasterTargetOrDirection(true)
spell:blockWalls(true)
spell:cooldown(10 * 1000)
spell:groupCooldown(5 * 1000, 10 * 1000)
spell:needLearn(false)
spell:vocation("necromancer;true")
spell:register()