local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_UNDEFINEDDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)


local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 3000)
condition:setFormula(-1, 81, -1, 81)

local spell = Spell("instant")

local mute = Condition(CONDITION_MUTED)
mute:setParameter(CONDITION_PARAM_TICKS, 3000)
    
function spell.onCastSpell(creature, var)
    if not creature:getCondition(CONDITION_MUTED) then
        if creature:getTarget() and creature:getTarget():isPlayer() then 


            creature:getTarget():say("PARALYZED.", TALKTYPE_MONSTER_SAY)
            combat:addCondition(condition)

            creature:teleportTo(Position(creature:getTarget():getPosition()))
            creature:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)

            return combat:execute(creature, var)
            
        end
        else
    creature:sendCancelMessage("You are Still Silenced.")
    end
end
spell:group("attack")
spell:id(8711)
spell:name("Get Closer")
spell:words("Jump")
spell:level(16)
spell:mana(20)
spell:isPremium(true)
spell:range(6)
spell:needCasterTargetOrDirection(true)
spell:blockWalls(true)
spell:cooldown(1 * 4000)
spell:groupCooldown(0 * 1000)
spell:needLearn(false)
spell:vocation("barbarian;true")
spell:register()