local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(player, level, magicLevel) -- already compared to the official tibia | compared date: 05/07/19(m/d/y)
	local min = (level + magicLevel * 12) + 75
	local max = (level + magicLevel * 20) + 125
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:name("Salvation")
spell:words("exura max san")
spell:group("healing")
spell:vocation("paladin;true", "royal paladin;true")
spell:id(36)
spell:cooldown(30 * 1000)
spell:groupCooldown(30 * 1000)
spell:level(100)
spell:mana(210)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
