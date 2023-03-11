local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)

local area = createCombatArea(AREA_WAVE4, AREADIAGONAL_WAVE4)
combat:setArea(area)

local condition = Condition(CONDITION_FIRE)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:addDamage(25, 3000, -45)
combat:addCondition(condition)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 4.5) + 25
	local max = (level / 5) + (maglevel * 7.3) + 45
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

local mute = Condition(CONDITION_MUTED)
mute:setParameter(CONDITION_PARAM_TICKS, 4000)


function spell.onCastSpell(creature, var)
if not creature:getCondition(CONDITION_MUTED) then
	return combat:execute(creature, var)
			else
    creature:sendCancelMessage("You are Still Silenced.")
    end
end

spell:group("attack")
spell:id(8706)
spell:name("Fire Wave")
spell:words("exevo flam hurs")
spell:level(18)
spell:mana(25)
spell:isPremium(true)
spell:needDirection(true)
spell:cooldown(4 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("incendiary mage;true")
spell:register()