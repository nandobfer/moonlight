local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
-- combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(player, level, magicLevel) -- already compared to the official tibia | compared date: 05/07/19(m/d/y)
	local min = (level * 0.2 + magicLevel * 1.4) + 8
	local max = (level * 0.2 + magicLevel * 1.795) + 11
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:group("healing")
spell:id(169)
spell:name("Cauterize Wounds")
spell:words("exura min flam")
spell:cooldown(10 * 1000)
spell:groupCooldown(10 * 1000)
spell:level(10)
spell:mana(100)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()