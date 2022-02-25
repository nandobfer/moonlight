local internalNpcName = "Marvik"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 130,
	lookHead = 0,
	lookBody = 101,
	lookLegs = 120,
	lookFeet = 95,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

	local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if MsgContains(message, 'feral form') or MsgContains(message, 'feral forms') then
		local player = Player(creature)
		if player:getVocation():getId() == 2 then
			npcHandler:say('A qual animal voce deseja vincular seu espirito? O nobre {leao}, o intimidador {tigre}, a masjestosa {pantera}, o feroz {lobo} ou o leal {cao}?', npc, creature)
			npcHandler:setTopic(playerId, 1)
		end
			-- FERAL FORMS --
	elseif MsgContains(message, "pantera") and npcHandler:getTopic(playerId) == 1 then
			npcHandler:say('Voce agora compartilha o espirito com o de uma pantera!', npc, creature)
			player:setStorageValue(Storage_.feral_animal_skin, 1)
			player:getPosition():sendMagicEffect(CONST_ME_YALAHARIGHOST)
	elseif MsgContains(message, "cao") and npcHandler:getTopic(playerId) == 1 then
			npcHandler:say('Voce agora compartilha o espirito com o de um cachorro!', npc, creature)
			player:setStorageValue(Storage_.feral_animal_skin, 2)
			player:getPosition():sendMagicEffect(CONST_ME_YALAHARIGHOST)
	elseif MsgContains(message, "leao") and npcHandler:getTopic(playerId) == 1 then
			npcHandler:say('Voce agora compartilha o espirito com o de um leao!', npc, creature)
			player:setStorageValue(Storage_.feral_animal_skin, 3)
			player:getPosition():sendMagicEffect(CONST_ME_YALAHARIGHOST)
	elseif MsgContains(message, "tigre") and npcHandler:getTopic(playerId) == 1 then
			npcHandler:say('Voce agora compartilha o espirito com o de um tigre!', npc, creature)
			player:setStorageValue(Storage_.feral_animal_skin, 4)
			player:getPosition():sendMagicEffect(CONST_ME_YALAHARIGHOST)
	elseif MsgContains(message, "lobo") and npcHandler:getTopic(playerId) == 1 then
			npcHandler:say('Voce agora compartilha o espirito com o de um lobo!', npc, creature)
			player:setStorageValue(Storage_.feral_animal_skin, 5)
			player:getPosition():sendMagicEffect(CONST_ME_YALAHARIGHOST)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)															
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
