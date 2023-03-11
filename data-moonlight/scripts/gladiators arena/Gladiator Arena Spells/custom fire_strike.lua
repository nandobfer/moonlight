local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

local condition = Condition(CONDITION_FIRE)
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
condition:addDamage(25, 3000, -45)
combat:addCondition(condition)

local spell = Spell("instant")
local mute = Condition(CONDITION_MUTED)
mute:setParameter(CONDITION_PARAM_TICKS, 4000)


function spell.onCastSpell(creature, var)
if not creature:getCondition(CONDITION_MUTED) then
	if creature:getTarget() and creature:getTarget():isPlayer() then
	return combat:execute(creature, var)
			else
    creature:sendCancelMessage("You are Still Silenced.")
    end
end
end


spell:group("attack")
spell:id(8705)
spell:name("Ignite")
spell:words("exori flams")
spell:level(26)
spell:mana(30)
spell:isAggressive(true)
spell:range(3)
spell:needTarget(true)
spell:blockWalls(true)
spell:needWeapon(false)
spell:cooldown(30 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("incendiary mage;true")
spell:register()