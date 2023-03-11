local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
combat:setArea(createCombatArea(AREA_SQUARE1X1))

function onGetFormulaValues(player, level, maglevel)
	local min = (level * 0.5) + 4
	local max = (level * 1.5) + 12

	return -min, -max
end

function onTargetCreature(creature, target)
	local player = creature:getPlayer()
	
	-- player, tipo, multiplier, duracao
	applyDot(player, target, "burning", 1, 8)
	
end
local combat2 = Combat()
combat2:setArea(createCombatArea(AREA_SQUARE1X1))
combat2:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	combat2:execute(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack", "special")
spell:id(19)
spell:name("Tiro Explosivo")
spell:words("exori con flam")
spell:level(25)
spell:mana(50)
spell:isPremium(true)
spell:range(7)
spell:needTarget(true)
spell:blockWalls(true)
spell:cooldown(8 * 1000)
spell:groupCooldown(2 * 1000, 8 * 1000)
spell:needLearn(false)
spell:vocation("hunter;true")
spell:register()