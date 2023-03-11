local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)

function onGetFormulaValues(player, level, maglevel)
    local min = (level / 5) + (maglevel * 1.403) + 8
    local max = (level / 5) + (maglevel * 2.203) + 13
    return -min, -max
end
    
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
    
local spell = Spell("instant")

local mute = Condition(CONDITION_MUTED)
mute:setParameter(CONDITION_PARAM_TICKS, 3000)
    
function spell.onCastSpell(creature, var)
    if not creature:getCondition(CONDITION_MUTED) then
        if creature:getTarget() and creature:getTarget():isPlayer() then 
            creature:getTarget():say("SILENCED.", TALKTYPE_MONSTER_SAY)
            combat:addCondition(mute)
            return combat:execute(creature, var)
        end
        return combat:execute(creature, var)
	else
    creature:sendCancelMessage("You are Still Silenced.")
    end
end
spell:group("attack")
spell:id(8700)
spell:name("Silence Death Strike")
spell:words("exori morts")
spell:level(16)
spell:mana(20)
spell:isPremium(true)
spell:range(6)
spell:needCasterTargetOrDirection(true)
spell:blockWalls(true)
spell:cooldown(1 * 4000)
spell:groupCooldown(1 * 1000)
spell:needLearn(false)
spell:vocation("evil mage;true")
spell:register()