local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ONYXARROW)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)

function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()
	local target = player:getTarget()
	
	local min = (level / 5) + ((skill + 25) / 3) / 5 + 10
	local max = (level / 5) + (skill + 25) / 5 + 20
	
	if (target:getHealth() / target:getMaxHealth() * 100) <= 30 then
		target:addHealth(-max * 2, COMBAT_PHYSICALDAMAGE)
	else end
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(111)
spell:name("Tiro Mortal")
spell:words("exori con mort")
spell:level(8)
spell:mana(50)
spell:isPremium(true)
spell:range(7)
spell:needTarget(true)
spell:blockWalls(true)

spell:cooldown(1 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("hunter;true")
spell:register()