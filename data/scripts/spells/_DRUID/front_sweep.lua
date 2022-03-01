local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat:setArea(createCombatArea(AREA_WAVE6, AREADIAGONAL_WAVE6))

local condition = Condition(CONDITION_BLEEDING) -- sangramento bear
condition:setParameter(CONDITION_PARAM_DELAYED, 1)
local condition2 = Condition(CONDITION_BLEEDING) -- sangramento feral
condition2:setParameter(CONDITION_PARAM_DELAYED, 1)

function onGetFormulaValues(player, skill, attack, factor)

	local min = 0
	local max = -1
	local bleedbear = 0
	
	local skillTotal = skill * attack
	local levelTotal = player:getLevel() / 5
		
	min = (((skillTotal * 0.04) + 31) + (levelTotal)) / 2
	max = (((skillTotal * 0.08) + 45) + (levelTotal)) / 2
		
	if (player:getStorageValue(Storage_.bear_form) > 0) then -- se for urso, causa metade do dano
			bleedbear = (((skillTotal * 0.08) + 45) + (levelTotal)) / 4 -- max / 2 , usar a variavel max estava bugando ao transformar em feral
			condition:addDamage(2, 1000, - bleedbear)
			condition:addDamage(3, 1000, - bleedbear * 2 / 3)
			--condition:addDamage(5, 1000, - bleedbear / 3)
			combat:addCondition(condition)
			
		else
			condition2:addDamage(2, 1000, -(max / 2))
			condition2:addDamage(3, 1000, -(max / 2) * 2 / 3)
			--condition2:addDamage(5, 1000, -(max / 2) / 3)
			combat:addCondition(condition2)
		end

	return -min, -max -- TODO : Use New Real Formula instead of an %
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	if (creature:getStorageValue(Storage_.metamorfose) > 0) then -- se tiver transformado
		if creature:getPlayer():getFreeHands() then
			return combat:execute(creature, var)
		else
			return false
		end
	else
		creature:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		creature:sendTextMessage(MESSAGE_EVENT_ADVANCE,
		"Voce nao consegue fazer isso se nao estiver transformado em uma fera!")
		return false
	end
end

spell:group("attack")
spell:id(59)
spell:name("Rip")
spell:words("exori min")
spell:level(30)
spell:mana(0)
spell:isPremium(true)
spell:needDirection(true)
spell:needWeapon(false)
spell:cooldown(1 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true")
spell:register()