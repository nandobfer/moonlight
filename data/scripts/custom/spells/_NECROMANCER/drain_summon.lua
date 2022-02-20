local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local player = creature:getPlayer()
	local summons = #player:getSummons()
	local dragon = false
	
	for _, summon in ipairs (player:getSummons()) do
		summon:addHealth(-(summon:getMaxHealth() * 0.01 * 50)) -- consome 50% da vida do pet
		if summon:getName() == "Summoned Undead Dragon" then
			dragon = true
		else end
	end
	
	if not dragon then
		if summons <= 5 then
			player:addHealth(player:getMaxHealth() * 0.01 * 10 * summons) -- cura o jogador em 20% de sua vida por pet afetado
		else
			player:addHealth(player:getMaxHealth() * 0.01 * 50)
		end
	else
		player:addHealth(player:getMaxHealth() * 0.01 * 50)
	end
	return true
end

spell:group("healing")
spell:id(87)
spell:name("Drain Summons")
spell:words("exura mort")
spell:level(35)
spell:mana(100)
spell:isPremium(true)
spell:range(3)
spell:needCasterTargetOrDirection(true)
spell:blockWalls(true)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("necromancer;true")
spell:register()