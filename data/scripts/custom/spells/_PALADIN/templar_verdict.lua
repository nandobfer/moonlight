local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
-- combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLHOLY)

function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()
	local maglevel = player:getMagicLevel()
	local skillTotal = skill * attack
	local ps = player:getPoderSagrado()
	local min = ((((level) + (maglevel * 1.5) + 11) / 2 ) + ((skillTotal / 120) + (level)) / 2) / 2 * ps
	local max = ((((level) + (maglevel * 2.5) + 18)  / 2 ) + ((skillTotal / 20) + (level)) / 2) / 2  * ps
	
	local target = player:getTarget()
	target:addHealth(-math.random(min, max), COMBAT_HOLYDAMAGE)
	target:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
	player:removePoderSagrado()
	
	return -min, -max
end
combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local player = creature:getPlayer()
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(124)
spell:name("Holy Word: Templar's Verdict")
spell:words("exori gran san ico")
spell:level(30)
spell:mana(0)
spell:isPremium(true)
spell:range(1)
spell:needTarget(true)
spell:needWeapon(true)
spell:blockWalls(true)
spell:cooldown(3 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("paladin;true", "royal paladin;true")
spell:register()