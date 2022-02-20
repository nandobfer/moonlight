local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_DRAWBLOOD)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EXPLOSION)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)

local condition = Condition(CONDITION_BLEEDING) -- sangramento bear
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
local condition2 = Condition(CONDITION_BLEEDING) -- sangramento feral
condition2:setParameter(CONDITION_PARAM_DELAYED, 1)

function onGetFormulaValues(player, level, attack)

	local min = 0
	local max = -1
	
	local skillfist = player:getSkillLevel(SKILL_FIST)
	min = ((level / 2) + (skillfist * 2 / 3))
	max = ((level / 2) + (skillfist * 2.5))
		
	if (player:getStorageValue(Storage_.bear_form) > 0) then -- se for urso, causa metade do dano
		min = min / 2
		max = max / 2
		local bleedbear = (level / 2) + (skillfist * 2.5) / 4 -- max / 4 , usar a variavel max estava bugando ao transformar em feral
		condition:addDamage(2, 1000, - bleedbear)
		condition:addDamage(3, 1000, - bleedbear * 2 / 3)
		condition:addDamage(5, 1000, - bleedbear / 3)
		combat:addCondition(condition)
		
	else 
		condition2:addDamage(2, 1000, -(max / 2))
		condition2:addDamage(3, 1000, -(max / 2) * 2 / 3)
		condition2:addDamage(5, 1000, -(max / 2) / 3)
		combat:addCondition(condition2)
	end
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	if (creature:getStorageValue(Storage_.metamorfose) > 0) then -- se tiver transformado
		return combat:execute(creature, var)
	else
		creature:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		creature:sendTextMessage(MESSAGE_EVENT_ADVANCE,
		"Voce nao consegue fazer isso se nao estiver transformado em uma fera!")
		return false
	end
end

spell:group("attack")
spell:id(148)
spell:name("Bite")
spell:words("exori moe ico")
spell:level(16)
spell:mana(0)
spell:isPremium(true)
spell:range(1)
spell:needCasterTargetOrDirection(true)
spell:blockWalls(true)
spell:cooldown(10 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true")
spell:register()