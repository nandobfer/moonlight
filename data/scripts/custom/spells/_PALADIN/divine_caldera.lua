local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 4) + 20
	local max = (level / 5) + (maglevel * 6) + 40
	return -min, -max
end

function onTargetCreature(creature, target)
	local player = creature:getPlayer()
	local min = (player:getLevel() / 5) + (player:getMagicLevel() * 3) + 20
	local max = (player:getLevel() / 5) + (player:getMagicLevel() * 5) + 40

	doTargetCombatHealth(0, target, COMBAT_HEALING, min, max, CONST_ME_NONE)
	return true
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat2:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat2:setArea(createCombatArea(AREA_CIRCLE3X3))
combat2:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")


function spell.onCastSpell(creature, var)
	combat2:execute(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(124)
spell:name("Divine Caldera")
spell:words("exevo mas san")
spell:level(50)
spell:mana(320)
spell:isPremium(true)
spell:isSelfTarget(true)
spell:cooldown(4 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("paladin;true", "royal paladin;true")
spell:register()