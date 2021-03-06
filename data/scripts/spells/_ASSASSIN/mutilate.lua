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
	
	-- player, tipo, multiplier, duracao
	applyDot(player, player:getTarget(), "poison", 0.3, 5)
	
	return -min / 2, -max / 2 -- TODO : Use New Real Formula instead of an %
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local player = creature:getPlayer()
	if not player:getSinWeapons() then
		return false
	else
		player:addComboPoints(1)
		player:removeStealth()
		return combat:execute(creature, var)
	end
end

spell:group("attack")
spell:id(59)
spell:name("Mutilate")
spell:words("exori min")
spell:level(8)
spell:mana(20)
spell:range(1)
spell:isPremium(true)
spell:needTarget(true)
spell:needWeapon(true)
spell:cooldown(1 * 1000)
spell:groupCooldown(1 * 1000)
spell:needLearn(false)
spell:vocation("assassin;true")
spell:register()