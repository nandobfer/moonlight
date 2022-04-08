local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLPLANTS)
combat:setArea(createCombatArea(AREA_SQUAREWAVE5, AREADIAGONAL_SQUAREWAVE5))

local condition = Condition(CONDITION_POISON)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:addDamage(25, 3000, -90)
combat:addCondition(condition)

local root = Condition(CONDITION_ROOTED)
root:setTicks(4000)
combat:addCondition(root)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 3.5)
	local max = (level / 5) + (maglevel * 7)
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local mute = Condition(CONDITION_MUTED)
	if not creature:getCondition(CONDITION_MUTED) then
	return combat:execute(creature, var)
	else
    creature:sendCancelMessage("You are Still Silenced.")
	end
end

spell:group("attack")
spell:id(8728)
spell:name("Terra Wave")
spell:words("exevo tera hurs")
spell:level(38)
spell:mana(170)
spell:isPremium(true)
spell:needDirection(true)
spell:cooldown(4 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("earth mage;true")
spell:register()