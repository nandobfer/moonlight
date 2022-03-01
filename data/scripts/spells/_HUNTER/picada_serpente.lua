local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)

function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()
	
	local min = (level / 5) + ((skill + 25) / 3) / 5 + 5
	local max = (level / 5) + (skill + 25) / 5 + 10
	
	local condition = Condition(CONDITION_POISON)
	condition:setParameter(CONDITION_PARAM_DELAYED, 1)
	condition:addDamage(2, 1000, -(level / 2))
	condition:addDamage(2, 1000, -(level / 2 * 3 / 4))
	condition:addDamage(2, 1000, -(level / 2 * 2 / 4))
	condition:addDamage(2, 1000, -(level / 2 / 4))
	combat:addCondition(condition)

	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack", "special")
spell:id(111)
spell:name("Picada da Serpente")
spell:words("exori con serp")
spell:level(15)
spell:mana(50)
spell:isPremium(true)
spell:range(7)
spell:needTarget(true)
spell:blockWalls(true)

spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000, 8 * 1000)
spell:needLearn(false)
spell:vocation("hunter;true")
spell:register()