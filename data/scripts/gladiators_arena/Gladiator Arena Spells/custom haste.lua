local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_HASTE)
condition:setParameter(CONDITION_PARAM_TICKS, 33000)
condition:setFormula(0.3, -24, 0.3, -24)
combat:addCondition(condition)

local spell = Spell("instant")
local mute = Condition(CONDITION_MUTED)
mute:setParameter(CONDITION_PARAM_TICKS, 4000)

function spell.onCastSpell(creature, variant)
	if not creature:getCondition(CONDITION_MUTED) then
	local summons = creature:getSummons()
	if summons and type(summons) == 'table' and #summons > 0 then
		for i = 1, #summons do
			local summon = summons[i]
			local summon_t = summon:getType()
			if summon_t and summon_t:familiar() then
				local deltaSpeed = math.max(creature:getBaseSpeed() - summon:getBaseSpeed(), 0)
				local FamiliarSpeed = ((summon:getBaseSpeed() + deltaSpeed) * 0.3) - 24
				local FamiliarHaste = createConditionObject(CONDITION_HASTE)
				setConditionParam(FamiliarHaste, CONDITION_PARAM_TICKS, 33000)
				setConditionParam(FamiliarHaste, CONDITION_PARAM_SPEED, FamiliarSpeed)
				summon:addCondition(FamiliarHaste)
			end
		end
	end
	return combat:execute(creature, variant)
		else
    creature:sendCancelMessage("You are Still Silenced.")
    end
end

spell:name("Haste")
spell:words("utani hurs")
spell:group("support")
spell:vocation("evil mage;true", "incendiary mage;true", "barbarian")
spell:id(8704)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(14)
spell:mana(60)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
