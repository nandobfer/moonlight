local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_DRAWBLOOD)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EXPLOSION)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)

function onGetFormulaValues(player, level, attack)

	local min = 0
	local max = -1
	
	local skillfist = player:getSkillLevel(SKILL_FIST)
	min = ((level / 2) + (skillfist * 2 / 3)) / 2
	max = ((level / 2) + (skillfist * 2.5)) / 2
		
		
	if (player:getStorageValue(Storage_.bear_form) > 0) then -- se for urso, causa metade do dano
		applyBleeding(player, combat, 0.3)
		return -min / 2 , -max / 2
	else
		applyBleeding(player, combat, 0.4)
		return -min, -max
	end
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

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