local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GREENSMOKE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POISON)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

function onGetFormulaValues(player, level, maglevel)
	local cp = player:getComboPoints()
	local min = cp * level / 2
	local max = cp * level
	
	applyPoison(player, combat, 0.5)
	
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var) -- onCast com verificação de weapon para o Assassin
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
spell:id(19)
spell:name("Poison Bomb")
spell:words("exori gran mas sin")
spell:level(75)
spell:mana(40)
spell:isPremium(true)
spell:range(7)
spell:needTarget(true)
spell:cooldown(4 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("assassin;true")
spell:register()