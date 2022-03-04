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
	local min = (level + magicLevel * 5) + 50
	local max = (level + magicLevel * 8) + 90
	local hp_mod = _player:getHealth() / _player:getMaxHealth() * 100
	min = min * (2 - hp_mod / 100)
	max = max * (2 - hp_mod / 100)
	
	player:addHealth(math.random(min, max))
	return true
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	creature:getPlayer():addPoderSagrado()
	return combat:execute(creature, variant)
end

spell:name("Divine Healing")
spell:words("exura san")
spell:group("healing")
spell:vocation("paladin;true", "royal paladin;true")
spell:id(125)
spell:cooldown(10 * 1000)
spell:groupCooldown(10 * 1000)
spell:level(15)
spell:mana(70)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(false)
spell:needLearn(false)
spell:register()
