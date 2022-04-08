local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local skill = Condition(CONDITION_ATTRIBUTES)
skill:setParameter(CONDITION_PARAM_SUBID, 5)
skill:setParameter(CONDITION_PARAM_TICKS, 13000)
skill:setParameter(CONDITION_PARAM_SKILL_SHIELDPERCENT, 220)
skill:setParameter(CONDITION_PARAM_BUFF_DAMAGEDEALT, 65)
skill:setParameter(CONDITION_PARAM_BUFF_DAMAGERECEIVED, 85)
skill:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
combat:addCondition(skill)

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
		local mute = Condition(CONDITION_MUTED)
	if not creature:getCondition(CONDITION_MUTED) then
	if creature:getCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, 5) then
		creature:removeCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, 5)
	end
	return combat:execute(creature, variant)
	else
    creature:sendCancelMessage("You are Still Silenced.")
    end
end

spell:name("Protector")
spell:words("utamo tempos")
spell:group("support", "focus")
spell:vocation("tank;true")
spell:id(8716)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000, 2 * 1000)
spell:level(55)
spell:mana(200)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
