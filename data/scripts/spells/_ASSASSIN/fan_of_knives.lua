local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
-- combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()	
	local min = (level / 5) + (skill + attack) / 3
	local max = (level / 5) + skill + attack
	
	applyPoison(player, combat, 0.3)
	
	if math.random(1, 100) <= 30 then
		player:setStorageValue(Storage_.bonus_combo_points, player:getStorageValue(Storage_.bonus_combo_points) + 1)
	else end
	
	return -min / 4, -max / 4
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
		if player:getStorageValue(Storage_.bonus_combo_points) ~= 0 then
			player:addComboPoints(player:getStorageValue(Storage_.bonus_combo_points))
			player:setStorageValue(Storage_.bonus_combo_points, 0)
		else end
		return true
	end
end

spell:group("attack")
spell:id(19)
spell:name("Fan of Knives")
spell:words("exori mas sin")
spell:level(35)
spell:mana(40)
spell:isPremium(true)
spell:cooldown(1 * 1000)
spell:groupCooldown(1 * 1000)
spell:needLearn(false)
spell:vocation("assassin;true")
spell:register()