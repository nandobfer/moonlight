local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat:setArea(createCombatArea(AREA_WAVE6, AREADIAGONAL_WAVE6))

function onGetFormulaValues(player, skill, attack, factor)

	local min = 0
	local max = -1
	
	local skillTotal = skill * attack
	local levelTotal = player:getLevel() / 5
		
	min = (((skillTotal * 0.04) + 31) + (levelTotal)) / 2
	max = (((skillTotal * 0.08) + 45) + (levelTotal)) / 2
		
	if player:getForm() == "bear" or player:getForm() == "plant" then -- se for urso, causa metade do dano
		applyDot(player, player:getTarget(), "bleeding", 0.2, 6)
		return -min / 2 , -max / 2
	else
		applyDot(player, player:getTarget(), "bleeding", 0.5, 6)
		return -min, -max
	end
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	if player:getForm() then -- se tiver transformado
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
spell:words("exori moe rip")
spell:level(30)
spell:mana(0)
spell:isPremium(true)
spell:needDirection(true)
spell:needWeapon(false)
spell:cooldown(5 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true")
spell:register()