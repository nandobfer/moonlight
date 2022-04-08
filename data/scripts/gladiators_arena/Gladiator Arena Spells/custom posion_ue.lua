local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_POISONAREA)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))

local condition = Condition(CONDITION_POISON)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:addDamage(100, 3000, -150)
combat:addCondition(condition)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 5)
	local max = (level / 5) + (maglevel * 10)
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")
local mute = Condition(CONDITION_MUTED)



function spell.onCastSpell(creature, variant)
if not creature:getCondition(CONDITION_MUTED) then
	return combat:execute(creature, variant)
			else
    creature:sendCancelMessage("You are Still Silenced.")
    end
end

spell:group("attack", "focus")
spell:id(8729)
spell:name("Hell's Core")
spell:words("exevo gran mas pox")
spell:level(60)
spell:mana(1100)
spell:isSelfTarget(true)
spell:isPremium(true)
spell:cooldown(40 * 1000)
spell:groupCooldown(4 * 1000, 40 * 1000)
spell:needLearn(false)
spell:vocation("earth mage;true")
spell:register()
