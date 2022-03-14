local config = {
	mana = 10,
	duration = 1000 * 10 -- segundos
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local condition = Condition(CONDITION_REGENERATION)
	condition:setTicks(config.duration)
	condition:setParameter(CONDITION_PARAM_MANAGAIN, config.mana)
	condition:setParameter(CONDITION_PARAM_MANATICKS, 1 * 1000)
	creature:addCondition(condition)
	return combat:execute(creature, var)
end

spell:name("Concentracao")
spell:words("utamo conc")
spell:group("support")
spell:vocation("hunter;true")
spell:id(44)
spell:cooldown(60 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(35)
spell:mana(0)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
