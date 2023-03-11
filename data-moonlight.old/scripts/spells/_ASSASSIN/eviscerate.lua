local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ASSASSIN)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)

function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()
	local cp = 	player:getComboPoints()
	local min = ((level / 5) + (skill + attack)) * cp / 3
	local max = ((level / 5) + (skill + attack)) * cp
	
	-- player, tipo, multiplier, duracao
	applyDot(player, player:getTarget(), "poison", 0.7, 10)

	return -min / 2, -max / 2
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local player = creature:getPlayer()
	if not player:getSinWeapons() then
		return false
	else
		player:removeStealth()
		combat:execute(creature, var)
		player:removeComboPoints()
		return true
	end
end

spell:group("attack")
spell:id(107)
spell:name("Eviscerate")
spell:words("exori gran sin")
spell:level(20)
spell:mana(40)
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