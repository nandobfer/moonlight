local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
local condition = Condition(CONDITION_LIGHT)
condition:setParameter(CONDITION_PARAM_LIGHT_LEVEL, 6)
condition:setParameter(CONDITION_PARAM_LIGHT_COLOR, 215)
condition:setParameter(CONDITION_PARAM_TICKS, (6 * 60 + 10) * 1000)
combat:addCondition(condition)

function onGetFormulaValues(_player, level, magicLevel) -- already compared to the official tibia | compared date: 05/07/19(m/d/y)
	local min = ((level + magicLevel * 5) + 50) / 3
	local max = ((level + magicLevel * 8) + 90) / 3
	local hp_mod = _player:getHealth() / _player:getMaxHealth() * 100
	local ps = _player:getPoderSagrado()
	min = min * (2 - hp_mod / 100) * ps
	max = max * (2 - hp_mod / 100) * ps
	_player:removePoderSagrado()
	_player:addHealth(math.random(min, max))
	return true
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:name("Holy Word: Glory")
spell:words("exura gran san")
spell:group("healing")
spell:vocation("paladin;true", "royal paladin;true")
spell:id(125)
spell:cooldown(1 * 1000)
spell:groupCooldown(1 * 1000)
spell:level(12)
spell:mana(0)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(false)
spell:needLearn(false)
spell:register()
