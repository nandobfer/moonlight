local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLHOLY)

function onGetFormulaValues(player, level, maglevel)
	local min = (level) + (maglevel * 1.79) + 11
	local max = (level) + (maglevel * 3) + 18
	return -min * 1.2, -max * 1.2
end
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local player = creature:getPlayer()
	if math.random(1, 100) <= 60 then
		player:addPoderSagrado()
	else end
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(122)
spell:name("Judgement")
spell:words("exori san")
spell:level(25)
spell:mana(40)
spell:isPremium(true)
spell:range(4)
spell:needCasterTargetOrDirection(true)
spell:blockWalls(true)
spell:cooldown(8 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("paladin;true", "royal paladin;true")
spell:register()