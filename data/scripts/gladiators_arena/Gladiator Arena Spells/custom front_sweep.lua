local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat:setArea(createCombatArea(AREA_WAVE6, AREADIAGONAL_WAVE6))

local root = Condition(CONDITION_ROOTED)
root:setTicks(3000)
combat:addCondition(root)

local mute = Condition(CONDITION_MUTED)
mute:setParameter(CONDITION_PARAM_TICKS, 3000)



function onGetFormulaValues(player, skill, attack, factor)
	local skillTotal = skill * attack
	local levelTotal = player:getLevel() / 5
	return -(((skillTotal * 0.04) + 31) + (levelTotal)) * 1.1, -(((skillTotal * 0.08) + 45) + (levelTotal)) * 1.1 -- TODO : Use New Real Formula instead of an %
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local mute = Condition(CONDITION_MUTED)
    if not creature:getCondition(CONDITION_MUTED) then
        			
	    return combat:execute(creature, var)
		--creature:getTarget():say("Stuned.", TALKTYPE_MONSTER_SAY)
       
	else
    creature:sendCancelMessage("You are Still Silenced.")
    end
end


spell:group("attack")
spell:id(8714)
spell:name("Front Sweep")
spell:words("exori mins")
spell:level(70)
spell:mana(0)
spell:isPremium(true)
spell:needDirection(true)
spell:needWeapon(true)
spell:cooldown(6 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("warrior;true")
spell:register()