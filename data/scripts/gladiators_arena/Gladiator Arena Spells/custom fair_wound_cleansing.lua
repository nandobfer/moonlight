local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

function onGetFormulaValues(_player, level, magicLevel) -- already compared to the official tibia | compared date: 05/07/19(m/d/y)
	local min = (level * 0.2 + magicLevel * 4 + 25) * 2
	local max = (level * 0.2 + magicLevel * 7.95 + 51) * 2
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	local mute = Condition(CONDITION_MUTED)
	if not creature:getCondition(CONDITION_MUTED) then
	return combat:execute(creature, variant)
	else
    creature:sendCancelMessage("You are Still Silenced.")
    end
end

spell:group("healing")
spell:id(8715)
spell:name("Fair Wound Cleansing")
spell:words("exura med icos")
spell:level(300)
spell:mana(90)
spell:isPremium(true)
spell:isSelfTarget(true)
spell:cooldown(1000)
spell:groupCooldown(1000)
spell:isAggressive(false)
spell:vocation("tank;true")
spell:needLearn(false)
spell:register()
