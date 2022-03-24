local internalNpcName = "Malik"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 335,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 95,
	lookAddons = 3
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

keywordHandler:addKeyword({'rules'}, StdModule.say, {npcHandler = npcHandler, text = 'What do you want to know? Something about the {general} rules or the new {vocations}? Maybe you also want to know about our {fee} or what happens when you {die}?'})
keywordHandler:addKeyword({'fee'}, StdModule.say, {npcHandler = npcHandler, text = 'The fee is 500 gold for one 1v1 battle. Se lembre... Grande recompensas sempre vem aos vencedores.'})
keywordHandler:addKeyword({'die'}, StdModule.say, {npcHandler = npcHandler, text = 'Nothing to worry about, no penalty will apply if you die inside the arena. Brave warriors fight to the "death"... .'})
keywordHandler:addKeyword({'general'}, StdModule.say, {npcHandler = npcHandler, text = "Our intention is to provide a fair 1vs1 battle, with a new concept about balance. To do this, all your progress will be saved before temporarily granting you a new {vocation} with five preset {spells}, new items and skills proportional to your opponents. Don't worry! All your progress will be restored at the end of the battle."})
keywordHandler:addKeyword({'vocations'}, StdModule.say, {npcHandler = npcHandler, text = "Nine new vocations are available within the four classes! Sorcerers: {Evil Mages} and {Incendiary Mages}. Druids: {Earth Mages} and {Ice Mages}. Paladins: {Archers} and {Spearmans}. Knights: {Tanks}, {Warriors} and {Barbarians}."})
keywordHandler:addKeyword({'vocation'}, StdModule.say, {npcHandler = npcHandler, text = "Nine new vocations are available based on the four classes! Sorcerers: {Evil Mages} and {Incendiary Mages}. Druids: {Earth Mages} and {Ice Mages}. Paladins: {Archers} and {Spearmans}. Knights: {Tanks}, {Warriors} and {Barbarians}."})
keywordHandler:addKeyword({'Evil Mages'}, StdModule.say, {npcHandler = npcHandler, text = ""})
keywordHandler:addKeyword({'Incendiary Mages'}, StdModule.say, {npcHandler = npcHandler, text = ""})
keywordHandler:addKeyword({'Earth Mages'}, StdModule.say, {npcHandler = npcHandler, text = ""})
keywordHandler:addKeyword({'Ice Mages'}, StdModule.say, {npcHandler = npcHandler, text = ""})
keywordHandler:addKeyword({'Archers'}, StdModule.say, {npcHandler = npcHandler, text = ""})
keywordHandler:addKeyword({'Spearmans'}, StdModule.say, {npcHandler = npcHandler, text = ""})
keywordHandler:addKeyword({'Tanks'}, StdModule.say, {npcHandler = npcHandler, text = ""})
keywordHandler:addKeyword({'Warriors'}, StdModule.say, {npcHandler = npcHandler, text = ""})
keywordHandler:addKeyword({'Barbarians'}, StdModule.say, {npcHandler = npcHandler, text = ""})
keywordHandler:addKeyword({'Spells'}, StdModule.say, {npcHandler = npcHandler, text = ""})
--keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, text = 'Well I would rather call it an {Ultimate Challenge} than a mission.'})

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local arenaId = player:getStorageValue(Storage.GladiatorArena.Arena)
	if MsgContains(message, 'fight') or MsgContains(message, 'arena') then

		if arenaId == -1 then --teste de nill storage fix.
			arenaId = 0
			player:setStorageValue(Storage.GladiatorArena.Arena, arenaId)
		end

		if arenaId == 1 then
			npcHandler:say('You already registered, prepare yourself and wait at the temple! You can also {leave},remember you will lose your ticket!', npc, creature)

			

			return true
		end


		if arenaId == 0 then
			npcHandler:say('So What vocation do you choose to battle with? {evil mage}, {incendiary mage}, {earth mage}, {ice mage}, {archer}, {aspearman}, {tank}, {warrior} or {barbarian}', npc, creature)
		npcHandler:setTopic(playerId, 1)
		end
		
		elseif npcHandler:getTopic(playerId) == 1 then

		if MsgContains(message, 'evil mage') then
		player:setStorageValue(100000002, 9)
		npcHandler:say('So you agree with the {rules} and want to register in the Arena as a Evil Mage? The {fee} for battle is 500 gold pieces. Do you really want to participate and pay the {fee}?', npc, creature)
		npcHandler:setTopic(playerId, 0)
		elseif MsgContains(message, 'incendiary mage') then
		player:setStorageValue(100000002, 10)
		npcHandler:say('So you agree with the {rules} and want to register in the Arena as a Incendiary Mage? The {fee} for battle is 500 gold pieces. Do you really want to participate and pay the {fee}?', npc, creature)
		npcHandler:setTopic(playerId, 0)
		elseif MsgContains(message, 'barbarian') then
		player:setStorageValue(100000002, 11)
		npcHandler:say('So you agree with the {rules} and want to register in the Arena as a Barbarian? The {fee} for battle is 500 gold pieces. Do you really want to participate and pay the {fee}?', npc, creature)
		npcHandler:setTopic(playerId, 0)
		
		end

	elseif npcHandler:getTopic(playerId) == 0 then

		if MsgContains(message, 'yes') then

			if player:removeMoneyBank(500) then
				player:setStorageValue(Storage.GladiatorArena.Arena, 1)
				addFila(player)			
			else
				npcHandler:say('You do not have enough money.', npc, creature)
			end
		
		else
			if MsgContains(message, 'leave') then
			player:setStorageValue(Storage.GladiatorArena.Arena, 0)
			removeFila(player)
			else
			npcHandler:say('Come back when you are ready then.', npc, creature)
			end

		npcHandler:setTopic(playerId, 0)
		end
	return true
	end
end


npcHandler:setMessage(MESSAGE_GREET, 'Hello competitor! Do you want to {fight} in the arena or shall I explain the {rules} first? You also can {leave}...')
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

-- npcType registering the npcConfig table
npcType:register(npcConfig)
