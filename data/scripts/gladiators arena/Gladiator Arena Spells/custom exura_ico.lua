local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(player, level, magicLevel) -- already compared to the official tibia | compared date: 08/03/21(m/d/y)
	local min = (level * 0.2 + magicLevel * 8) + 200
	local max = (level * 0.2 + magicLevel * 16) + 300
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")
local mute = Condition(CONDITION_MUTED)
mute:setParameter(CONDITION_PARAM_TICKS, 4000)

function spell.onCastSpell(creature, variant)
	if not creature:getCondition(CONDITION_MUTED) then
	return combat:execute(creature, variant)
			else
    creature:sendCancelMessage("You are Still Silenced.")
    end
end

spell:name("Wound Cleansing")
spell:words("exura icos")
spell:group("healing")
spell:vocation("barbarian;true")
spell:id(8708)
spell:cooldown(1 * 1000)
spell:groupCooldown(1 * 1000)
spell:level(10)
spell:mana(40)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:register()