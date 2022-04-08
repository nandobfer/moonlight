local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)

function onGetFormulaValues(player, skill, attack, factor)
	local skillTotal = skill * attack
	local levelTotal = player:getLevel() / 5
	return -(((skillTotal * 0.17) + 13) + (levelTotal)) * 1.28, -(((skillTotal * 0.20) + 34) + (levelTotal)) * 1.28 -- TODO : Use New Real Formula instead of an %
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

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
spell:id(8710)
spell:name("Annihilation")
spell:words("exori gran icos")
spell:level(100)
spell:mana(300)
spell:isPremium(true)
spell:range(1)
spell:needTarget(true)
spell:blockWalls(true)
spell:needWeapon(true)
spell:cooldown(30 * 1000)
spell:groupCooldown(4 * 1000)
spell:needLearn(false)
spell:vocation("barbarian;true")
spell:register()