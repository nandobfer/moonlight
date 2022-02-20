local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local player = creature:getPlayer()
	local min = player:getLevel() / 2
	local max = player:getLevel() * 2
	
	for _, summon in ipairs (player:getSummons()) do
		summon:getTarget():addHealth(-math.random(min, max), COMBAT_PHYSICALDAMAGE)
	end
	
	return true
end

spell:group("attack")
spell:id(148)
spell:name("Comando para matar")
spell:words("exori spir")
spell:level(8)
spell:mana(50)
spell:isPremium(true)
spell:needTarget(true)
spell:cooldown(10 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("hunter;true")
spell:register()