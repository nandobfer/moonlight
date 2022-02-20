local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local skill = Condition(CONDITION_ATTRIBUTES)
skill:setParameter(CONDITION_PARAM_TICKS, -1)
skill:setParameter(CONDITION_PARAM_SKILL_DISTANCEPERCENT, 140)
skill:setParameter(CONDITION_PARAM_DISABLE_DEFENSE, true)
skill:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
combat:addCondition(skill)

-- local speed = Condition(CONDITION_PARALYZE)
-- speed:setParameter(CONDITION_PARAM_TICKS, 10000)
-- speed:setFormula(-0.7, 56, -0.7, 56)
-- combat:addCondition(speed)

-- local exhaustHealGroup = Condition(CONDITION_SPELLGROUPCOOLDOWN)
-- exhaustHealGroup:setParameter(CONDITION_PARAM_SUBID, 2)
-- exhaustHealGroup:setParameter(CONDITION_PARAM_TICKS, 10000)
-- combat:addCondition(exhaustHealGroup)

-- local exhaustSupportGroup = Condition(CONDITION_SPELLGROUPCOOLDOWN)
-- exhaustSupportGroup:setParameter(CONDITION_PARAM_SUBID, 3)
-- exhaustSupportGroup:setParameter(CONDITION_PARAM_TICKS, 10000)
-- combat:addCondition(exhaustSupportGroup)

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	local player = creature:getPlayer()
	
	if player:getLoneWolf() then
		player:setStorageValue(Storage_.lone_wolf, 0)
		player:removeCondition(CONDITION_ATTRIBUTES)
		return true
	elseif #player:getSummons() > 0 then
		player:sendCancelMessage("Nao pode fazer isto enquanto possuir um pet.")
		return false
	else
		player:setStorageValue(Storage_.lone_wolf, 1)
		return combat:execute(creature, variant)
	end
end

spell:name("Lone Wolf")
spell:words("utito tempo san")
spell:group("support", "healing")
spell:vocation("hunter;true")
spell:id(135)
spell:cooldown(0 * 1000)
spell:groupCooldown(0 * 1000, 0 * 1000)
spell:level(50)
spell:mana(00)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(false)
spell:needLearn(false)
spell:register()