local combat = Combat()
-- combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 1)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

function onTargetCreature(creature, target)
	local player = creature:getPlayer()
	local level = player:getLevel()
	local ml = player:getMagicLevel()
	local drain = (level / 5) + (ml / 2) + 10
	
	if target:isMonster() then
		target:addHealth(-drain, COMBAT_DEATHDAMAGE) -- causa dano
		target:getPosition():sendMagicEffect(CONST_ME_MORTAREA)
		player:addHealth(drain) -- cura o usuario
		return true
	end
	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(87)
spell:name("Drain Life")
spell:words("exori mas mort")
spell:level(13)
spell:mana(30)
spell:isPremium(true)
spell:range(3)
spell:needCasterTargetOrDirection(true)
spell:blockWalls(true)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("necromancer;true")
spell:register()