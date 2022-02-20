local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local player = creature:getPlayer()
	player:addHealth(-player:getMaxHealth() * 0.25, COMBAT_DEATHDAMAGE)
	player:addMana(player:getMaxMana() * 0.25)
	return true
end

spell:group("support")
spell:id(87)
spell:name("Conversao de Vida")
spell:words("utito mort")
spell:level(25)
spell:mana(0)
spell:isPremium(true)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("necromancer;true")
spell:register()