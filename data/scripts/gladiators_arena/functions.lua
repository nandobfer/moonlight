--[ARENA FUNCTIONS]

-- Pushlist (storage)
function organizarFila()
    for index, _ in ipairs(Fila) do
        for index2, __ in ipairs(Fila) do
            if Game.getStorageValue(Fila[index]) == 0 and index < index2 then
                Game.setStorageValue(Fila[index], Game.getStorageValue(Fila[index2]))
                Game.setStorageValue(Fila[index2], 0)
            end
        end
    end
end

-- adiciona player na queue
function addFila(player)
    for index, _ in ipairs(Fila) do
        if Game.getStorageValue(Fila[index]) == 0 then
            Game.setStorageValue(Fila[index], player:getId())
                  player:teleportTo(Position(32369, 32241, 7)) --teste de tp.
                  player:openChannel(12) -- Open Arena Channel
                  player:sendTextMessage(MESSAGE_STATUS, "sucessfully registered!")
                  arenaCheck()
            return true
        else end
    end
end

--remove player da queue reorganiza queue.
function removeFila(player)
    for index = 1, #Fila do
        if Game.getStorageValue(Fila[index]) == player:getId() then
            Game.setStorageValue(Fila[index], 0)
                  player:teleportTo(Position(32369, 32241, 7)) --teste de tp.
                  player:openChannel(12) -- Open Arena Channel
                  player:sendTextMessage(MESSAGE_STATUS, "sucessfully unregistered!")
            organizarFila()
            return true
       else end
    end
end

--verifica playerOne & playerTwo da queue & status da arena
function arenaCheck()
  if Game.getStorageValue(Fila[1]) ~= 0 and Game.getStorageValue(Fila[2]) ~= 0 then
    if Game.getStorageValue(ArenaStatus[1]) == 0 then
        Game.setStorageValue(ArenaPlayers[1], Game.getStorageValue(Fila[1]))
        Game.setStorageValue(ArenaPlayers[2], Game.getStorageValue(Fila[2]))
        Game.setStorageValue(Fila[1], 0)
        organizarFila()
        Game.setStorageValue(Fila[1], 0)
        organizarFila()
        setArenaVocation()
        return true
    end
 end 
end

--função setArenaVocation
function setArenaVocation(cid, item, position)
    for index = 1, #ArenaPlayers do
        local cid = Game.getStorageValue(ArenaPlayers[index])
        local player = Player(cid)

        --Player Storage Stats:
        player:setStorageValue(Storage.GladiatorArena.Level, player:getLevel()) -- Level
        player:setStorageValue(Storage.GladiatorArena.Experience, player:getExperience()) --Experience
        player:setStorageValue(Storage.GladiatorArena.OldVocation, player:getVocation():getId()) -- Vocation

            --LEVEL

            --Função para calculo de exp pro proximo level
            local function getExpForLevel(level)
            level = level - 1
            return ((50 * level * level * level) - (150 * level * level) + (400 * level)) / 3
            end

            targetLevel = ArenaVocations[player:getStorageValue(Storage.GladiatorArena.NewVocation)].lvl
            if player:getLevel() < targetLevel then
            targetExp = getExpForLevel(targetLevel)
            addExp = targetExp - player:getExperience()
            player:addExperience(addExp, false)
            else
            player:removeExperience(player:getExperience() - getExpForLevel(targetLevel), false)
            end

            --VOCATION
            player:setVocation(player:getStorageValue(Storage.GladiatorArena.NewVocation))

            --SKILL TREE
            local skill_bonus = Condition(CONDITION_ATTRIBUTES)
            skill_bonus:setTicks(-1)
            --Shield
            local shield = player:getSkillLevel(SKILL_SHIELD) --shield
            local skill_shield = -(shield- ArenaVocations[player:getStorageValue(Storage.GladiatorArena.NewVocation)].shield) 
            skill_bonus:setParameter(CONDITION_PARAM_SKILL_SHIELD, skill_shield)
            --Axe
            local axe = player:getSkillLevel(SKILL_AXE) --axe
            local skill_axe = -(axe- ArenaVocations[player:getStorageValue(Storage.GladiatorArena.NewVocation)].axe) 
            skill_bonus:setParameter(CONDITION_PARAM_SKILL_AXE, skill_axe)
            --Sword
            local sword = player:getSkillLevel(SKILL_SWORD) --axe
            local skill_sword = -(sword- ArenaVocations[player:getStorageValue(Storage.GladiatorArena.NewVocation)].sword) 
            skill_bonus:setParameter(CONDITION_PARAM_SKILL_SWORD, skill_sword)
            --Club
            local club = player:getSkillLevel(SKILL_CLUB) --axe
            local skill_club = -(club- ArenaVocations[player:getStorageValue(Storage.GladiatorArena.NewVocation)].club) 
            skill_bonus:setParameter(CONDITION_PARAM_SKILL_CLUB, skill_club)
            --Distance
            local distance = player:getSkillLevel(SKILL_DISTANCE) --axe
            local skill_distance = -(distance- ArenaVocations[player:getStorageValue(Storage.GladiatorArena.NewVocation)].distance) 
            skill_bonus:setParameter(CONDITION_PARAM_SKILL_DISTANCE, skill_distance)
            --Magic Level
            local ml = player:getMagicLevel()
            local magic_level = -(ml - ArenaVocations[player:getStorageValue(Storage.GladiatorArena.NewVocation)].magiclevel)
            skill_bonus:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, magic_level)

            --HP
            local playerhp = player:getMaxHealth()
            local new_hp = -(playerhp- ArenaVocations[player:getStorageValue(Storage.GladiatorArena.NewVocation)].health)
            skill_bonus:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTS, new_hp)

            --MP
            local playermp = player:getMaxMana()
            local new_mp = -(playermp- ArenaVocations[player:getStorageValue(Storage.GladiatorArena.NewVocation)].mana)
            skill_bonus:setParameter(CONDITION_PARAM_STAT_MAXMANAPOINTS, new_mp)
            
            --OUTFIT
            local condition = Condition(CONDITION_OUTFIT)
            condition:setTicks(-1)
            condition:setOutfit(ArenaVocations[player:getStorageValue(Storage.GladiatorArena.NewVocation)].outfit) --aqui vc coloca o outfit
            player:addCondition(condition)    

            player:addCondition(skill_bonus)
            player:addHealth(player:getMaxHealth())
            player:addMana(player:getMaxMana())

            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, ArenaVocations[player:getStorageValue(Storage.GladiatorArena.NewVocation)].spells)

end

--Seta os Itens de acordo com a table de vocações em fila.lua
function setArenaItem(cid, item, position)
    for index = 1, #ArenaPlayers do
    local cid = Game.getStorageValue(ArenaPlayers[index])
    local player = Player(cid)

 
    for index2 = 1, #ItemSlot do
    local voc = player:getStorageValue(Storage.GladiatorArena.NewVocation)
    local newItem = ArenaVocations[voc][index2]
        
        if player:getSlotItem(ItemSlot[index2]) ~= nil and player:getSlotItem(ItemSlot[index2]) ~= 0 then
            local item_id = player:getSlotItem(ItemSlot[index2]).itemid
            player:setStorageValue(StorageIndex[index2], item_id)
            player:removeItem(item_id, 1)
                        
        else
            player:setStorageValue(StorageIndex[index2], 0)
        end
            player:addItem(newItem)

    end

            startBattle()
        
    end
end

function startBattle(cid, item, position)
    for index = 1, #ArenaPlayers do
        local cid = Game.getStorageValue(ArenaPlayers[index])
        local player = Player(cid)

        if player:getId() == Game.getStorageValue(ArenaPlayers[1]) then
        player:teleportTo(Position(32087, 32339, 7))
        else
        player:teleportTo(Position(32087, 32341, 7))
        Game.setStorageValue(ArenaStatus[1], 1)
        end

        player:setStorageValue(Storage.GladiatorArena.Death, 1)

        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    end
end



--função addEvent para timer da arena.

--função arenaClear

