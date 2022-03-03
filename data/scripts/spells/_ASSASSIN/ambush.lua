local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)

function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()	
	local min = (level / 5) + (skill + attack) / 3
	local max = (level / 5) + skill + attack
	
	applyDot(player, player:getTarget(), "poison", 0.5, 5)
	
	return -min * 2, -max * 2 -- TODO : Use New Real Formula instead of an %
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var) -- onCast com verificação de weapon para o Assassin
	local player = creature:getPlayer()
	if not player:getSinWeapons() then
		return false
	else
			-- so pode ser usado invisivel, remove invisibilidade
		if player:getStealth() then
			player:removeStealth()
			player:addComboPoints(2)
			return combat:execute(creature, var)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
			"Voce nao consegue emboscar se nao estiver furtivo!")
			return false
		end
	end
end

spell:group("attack")
spell:id(107)
spell:name("Ambush")
spell:words("exori sin amb")
spell:level(25)
spell:mana(30)
spell:isPremium(true)
spell:range(1)
spell:needTarget(true)
spell:blockWalls(true)
spell:needWeapon(true)
spell:cooldown(1 * 1000)
spell:groupCooldown(1 * 1000)
spell:needLearn(false)
spell:vocation("assassin;true")
spell:register()