local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)

function onGetFormulaValues(player, skill, attack, factor)
	local skillTotal = skill * attack
	local levelTotal = player:getLevel() / 5
	local damage = 3 * ( (skillTotal / 100) + (levelTotal)), ( (skillTotal / 100) + (levelTotal)) * 6
	
	player:addHealth(player:getMaxHealth() * 0.01 * 10)
	
	return -damage -- TODO : Use New Real Formula instead of an %
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")


local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(61)
spell:name("Brutal Strike")
spell:words("exori ico")
spell:level(10)
spell:mana(10)
spell:isPremium(false)
spell:range(1)
spell:needTarget(true)
spell:blockWalls(true)
spell:needWeapon(true)
spell:cooldown(6 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("knight;true", "elite knight;true")
spell:register()