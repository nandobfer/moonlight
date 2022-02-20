local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local player = creature:getPlayer()
	creature:addHealth(-(creature:getMaxHealth() * 0.01 * 25)) -- custa 25% da vida do usuario
	
	for _, summon in ipairs (player:getSummons()) do
		summon:addHealth((summon:getMaxHealth() * 0.01 * 25)) -- cura o pet em 25% da vida dele
	end
	
	return true
end

spell:group("healing")
spell:id(87)
spell:name("Heal Summons")
spell:words("exura mas mort")
spell:level(15)
spell:mana(50)
spell:isPremium(true)
spell:range(3)
spell:needCasterTargetOrDirection(true)
spell:blockWalls(true)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("necromancer;true")
spell:register()