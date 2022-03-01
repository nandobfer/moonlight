local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local player = creature:getPlayer()
	local target = player:getTarget()
	
	local pos = target:getPosition()
	local positions = {
			{x = pos.x + 1, y = pos.y + 1, z = pos.z},
			{x = pos.x, y = pos.y + 1, z = pos.z},
			{x = pos.x + 1, y = pos.y, z = pos.z},
			{x = pos.x + 1, y = pos.y - 1, z = pos.z},
			{x = pos.x - 1, y = pos.y + 1, z = pos.z},
			{x = pos.x - 1, y = pos.y, z = pos.z},
			{x = pos.x - 1, y = pos.y - 1, z = pos.z},
			{x = pos.x, y = pos.y - 1, z = pos.z}
		} 
	
	if #positions < 1 or not target then
		return false
	end
		
	local index = math.random(#positions)
	local toPos = positions[index]
	
	local min = player:getLevel() / 2
	local max = player:getLevel() * 2
	
	for _, summon in ipairs (player:getSummons()) do
		if not isWalkable(toPos) then
			repeat
				 table.remove(positions, index)
				index = math.random(#positions)
				toPos = positions[index]
				if #positions < 1 then
					return false
				end
			until isWalkable(toPos)
		end
		summon:teleportTo(toPos)
		summon:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		table.remove(positions, index)
		target:addHealth(-math.random(min, max), COMBAT_PHYSICALDAMAGE)
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