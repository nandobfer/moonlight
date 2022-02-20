local function teleport(creature, parameter, variant)
	local player = creature:getPlayer()
	local fromPosition = creature:getPosition()
	local town = Town(parameter) or Town(tonumber(parameter))
	
	if town then
			if player:getStorageValue(Storage_.teleport[parameter]) < 1 then
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
				"Voce nao sabe teleportar para essa cidade! O sacerdote do templo de la pode te ensinar.")
				return false
			else end
		player:getPosition():sendMagicEffect(CONST_ME_CHIVALRIOUS_CHALLENGE)
		local root = Condition(CONDITION_ROOTED)
		root:setFormula(0, 0, 0, 0)
		root:setTicks(-1)
		player:addCondition(root)
		local pacify = Condition(CONDITION_PACIFIED)
		pacify:setTicks(-1)
		
		local pos = player:getPosition()
		local posis = {
			{x = pos.x + 1, y = pos.y + 1, z = pos.z},
			{x = pos.x, y = pos.y + 1, z = pos.z},
			{x = pos.x + 1, y = pos.y, z = pos.z},
			{x = pos.x + 1, y = pos.y - 1, z = pos.z},
			{x = pos.x - 1, y = pos.y + 1, z = pos.z},
			{x = pos.x - 1, y = pos.y, z = pos.z},
			{x = pos.x - 1, y = pos.y - 1, z = pos.z},
			{x = pos.x, y = pos.y - 1, z = pos.z}
		}
		
		addEvent(function()
			for index, value in ipairs(posis) do
				local tile = Tile(posis[index])
				 if tile:getTopCreature() then
					tile:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					tile:getTopCreature():teleportTo(town:getTemplePosition())
					-- tile:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				end
			end
		end, 9.5 * 1000)
		
		local j = 0
		for i = 9, 1, -1 do
			j = j + 1
			addEvent(function()
			player:say("to " .. parameter .. " in " .. i .. "")
			player:getPosition():sendMagicEffect(CONST_ME_CHIVALRIOUS_CHALLENGE)
			
			for index, value in ipairs(posis) do
				local tile = Tile(posis[index])
					tile:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			end
			
			end, j * 1000)
		end
		
		addEvent(function()
			creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:getPosition():sendMagicEffect(CONST_ME_CHIVALRIOUS_CHALLENGE)
			player:teleportTo(town:getTemplePosition())
			creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			player:getPosition():sendMagicEffect(CONST_ME_CHIVALRIOUS_CHALLENGE)
			
			player:removeCondition(CONDITION_ROOTED)
			player:removeCondition(CONDITION_PACIFIED)
			player:addMana(-player:getMaxMana())
		end, (j + 1) * 1000)

	else
		player:sendCancelMessage("Town not found.")
	end
	return false

end

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	
	teleport(creature, variant:getString():lower(), variant)
	return true
end

spell:name("Teleport")
spell:words("exani tele")
spell:group("support")
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:id(81)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(2)
spell:mana(0)
spell:hasParams(true)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
