local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local player = creature:getPlayer()
	
	for _, summon in ipairs (player:getSummons()) do
		summon:addHealth(summon:getMaxHealth() * 0.35)
	end
	
	return true
end

spell:group("healing")
spell:id(2)
spell:name("Mend Pet")
spell:words("exura spir")
spell:level(20)
spell:mana(50)
spell:isPremium(true)
spell:cooldown(7 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("hunter;true")
spell:register()