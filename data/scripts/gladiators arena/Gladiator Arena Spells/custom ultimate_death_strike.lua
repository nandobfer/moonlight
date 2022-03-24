local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_DEATHAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 4.5) + 35
	local max = (level / 5) + (maglevel * 7.3) + 55
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	if not creature:getCondition(CONDITION_MUTED) then
	return combat:execute(creature, var)
	else
    creature:sendCancelMessage("You are Still Silenced.")
    end
end

spell:group("attack", "ultimatestrikes")
spell:id(8701)
spell:name("Ultimate Death Strike")
spell:words("exori max mort")
spell:level(80)
spell:mana(200)
spell:isPremium(true)
spell:range(5)
spell:needCasterTargetOrDirection(true)
spell:blockWalls(true)
spell:cooldown(8 * 1000)
spell:groupCooldown(2 * 1000, 8 * 1000)
spell:needLearn(false)
spell:vocation("evil mage;true")
spell:register()