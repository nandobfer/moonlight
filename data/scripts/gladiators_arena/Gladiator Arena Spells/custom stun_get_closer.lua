local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))


local spell = Spell("instant")

local root = Condition(CONDITION_ROOTED)
root:setTicks(3000)
combat:addCondition(root)

local mute = Condition(CONDITION_MUTED)
mute:setParameter(CONDITION_PARAM_TICKS, 3000)
combat:addCondition(mute)
    
function spell.onCastSpell(creature, var)
    if not creature:getCondition(CONDITION_MUTED) then      


            --creature:getTarget():say("PARALYZED.", TALKTYPE_MONSTER_SAY)
            combat:addCondition(root)

            creature:teleportTo(Position(creature:getTarget():getPosition()))
            creature:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)

            return combat:execute(creature, var)

        else
            creature:sendCancelMessage("You are Still Silenced.")
    end
end
spell:group("attack")
spell:id(8717)
spell:name("Stun Get Closer")
spell:words("Jump Mas")
spell:level(16)
spell:mana(20)
spell:isPremium(true)
spell:range(6)
spell:needCasterTargetOrDirection(true)
spell:blockWalls(true)
spell:cooldown(1 * 4000)
spell:groupCooldown(0 * 1000)
spell:needLearn(false)
spell:vocation("tank;true")
spell:register()