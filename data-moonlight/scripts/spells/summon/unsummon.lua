local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local player = creature:getPlayer()
	
	for _, summon in ipairs (player:getSummons()) do
		summon:addHealth(-summon:getMaxHealth()) -- consome 100% da vida do pet
	end
	return true
end

spell:group("support")
spell:id(87)
spell:name("Dismiss Pet")
spell:words("utevo bye")
spell:level(8)
spell:mana(0)
spell:isPremium(true)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("necromancer;true", "hunter;true")
spell:register()