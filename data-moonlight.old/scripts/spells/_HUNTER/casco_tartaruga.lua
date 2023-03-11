local immunity = Condition(CONDITION_ATTRIBUTES)
local pacify = Condition(CONDITION_PACIFIED)
-- condition:setParameter(CONDITION_PARAM_SUBID, 5)
local duration = 1000 * 10
immunity:setParameter(CONDITION_PARAM_TICKS, duration)
pacify:setParameter(CONDITION_PARAM_TICKS, duration)
immunity:setParameter(CONDITION_PARAM_BUFF_DAMAGERECEIVED, 1)
immunity:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat:addCondition(immunity)
combat:addCondition(pacify)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	if creature:getCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, 5) then
		creature:removeCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, 5)
	end
	return combat:execute(creature, var)
end

spell:name("Casco de Tartaruga")
spell:words("utamo tart")
spell:group("support", "focus")
spell:vocation("hunter;true")
spell:id(133)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000, 2 * 1000)
spell:level(50)
spell:mana(0)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()