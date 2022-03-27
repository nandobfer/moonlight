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
                  --arenaCheck()
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


--Seta os Itens de acordo com a table de vocações em fila.lua
function setArenaItem(cid, item, position)
    for index, _ in ipairs(ArenaPlayers) do
        local cid = Game.getStorageValue(ArenaPlayers[index])
        local player = Player(cid)

    
        --Player Storage Itens:
        --helmet
        if player:getSlotItem(CONST_SLOT_HEAD) then
        local headItem = player:getSlotItem(CONST_SLOT_HEAD)
        player:setStorageValue(Storage.GladiatorArena.Helmet, headItem.itemid)
        player:removeItem(headItem.itemid, 1)
        else
        player:setStorageValue(Storage.GladiatorArena.Helmet, 0)
        end
        player:addItem(ArenaVocations[player:getStorageValue(100000002)].helmet)
        
        --armor
        if player:getSlotItem(CONST_SLOT_ARMOR) then
        local armorItem = player:getSlotItem(CONST_SLOT_ARMOR)
        player:setStorageValue(Storage.GladiatorArena.Armor, armorItem.itemid)
        player:removeItem(armorItem.itemid, 1)
        else
        player:setStorageValue(Storage.GladiatorArena.Armor, 0)    
        end
        player:addItem(ArenaVocations[player:getStorageValue(100000002)].armor)
        
        --legs
        if player:getSlotItem(CONST_SLOT_LEGS) then
        local legsItem = player:getSlotItem(CONST_SLOT_LEGS)
        player:setStorageValue(Storage.GladiatorArena.Legs, legsItem.itemid)
        player:removeItem(legsItem.itemid, 1)
        else
        player:setStorageValue(Storage.GladiatorArena.Legs, 0)     
        end
        player:addItem(ArenaVocations[player:getStorageValue(100000002)].legs)
        
        --boots
        if player:getSlotItem(CONST_SLOT_FEET) then
        local feetItem = player:getSlotItem(CONST_SLOT_FEET)
        player:setStorageValue(Storage.GladiatorArena.Boots, feetItem.itemid)
        player:removeItem(feetItem.itemid, 1)
        else
        player:setStorageValue(Storage.GladiatorArena.Boots, 0)     
        end
        player:addItem(ArenaVocations[player:getStorageValue(100000002)].boots)

        --Weapon
        if player:getSlotItem(CONST_SLOT_LEFT) then
        local leftItem = player:getSlotItem(CONST_SLOT_LEFT)
        player:setStorageValue(Storage.GladiatorArena.Weapon, leftItem.itemid)
        player:removeItem(leftItem.itemid, 1)
        else
        player:setStorageValue(Storage.GladiatorArena.Weapon, 0)     
        end
        player:addItem(ArenaVocations[player:getStorageValue(100000002)].leftweapon)
      
        --Shield
        if player:getSlotItem(CONST_SLOT_RIGHT) then
        local shieldItem = player:getSlotItem(CONST_SLOT_RIGHT)
        player:setStorageValue(Storage.GladiatorArena.Shield, shieldItem.itemid)
        player:removeItem(shieldItem.itemid, 1)
        else
        player:setStorageValue(Storage.GladiatorArena.Shield, 0)     
        end
        player:addItem(ArenaVocations[player:getStorageValue(100000002)].rightshield)
        
        --Amulet
        if player:getSlotItem(CONST_SLOT_NECKLACE) then
        local amuletItem = player:getSlotItem(CONST_SLOT_NECKLACE)
        player:setStorageValue(Storage.GladiatorArena.Amulet, amuletItem.itemid)
        player:removeItem(amuletItem.itemid, 1)
        else
        player:setStorageValue(Storage.GladiatorArena.Amulet, 0)     
        end
        player:addItem(ArenaVocations[player:getStorageValue(100000002)].amulet)
       
        --Ring
        if player:getSlotItem(CONST_SLOT_RING) then
        local ringItem = player:getSlotItem(CONST_SLOT_RING)
        player:setStorageValue(Storage.GladiatorArena.Ring, ringItem.itemid)
        player:removeItem(ringItem.itemid, 1)
        else
        player:setStorageValue(Storage.GladiatorArena.Ring, 0)     
        end
        player:addItem(ArenaVocations[player:getStorageValue(100000002)].ring)

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
        end

        Game.setStorageValue(ArenaStatus[index], 1)

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
        player:setStorageValue(Storage.GladiatorArena.Vocation, player:getVocation():getId()) -- Vocation


            --VOCATION
            player:setVocation(player:getStorageValue(100000002))

            --LEVEL

            --Função para calculo de exp pro proximo level
            local function getExpForLevel(level)
            level = level - 1
            return ((50 * level * level * level) - (150 * level * level) + (400 * level)) / 3
            end

            if player:getLevel() < 100 then
            targetLevel = 100
            targetExp = getExpForLevel(targetLevel)
            addExp = targetExp - player:getExperience()
            player:addExperience(addExp, false)
            else
            player:removeExperience(player:getExperience() - getExpForLevel(100), false)
            end


            --SKILL TREE
            local skill_bonus = Condition(CONDITION_ATTRIBUTES)
            skill_bonus:setTicks(-1)
            --Shield
            local shield = player:getSkillLevel(SKILL_SHIELD) --shield
            local skill_shield = -(shield- ArenaVocations[player:getStorageValue(100000002)].shield) 
            skill_bonus:setParameter(CONDITION_PARAM_SKILL_SHIELD, skill_shield)
            --Axe
            local axe = player:getSkillLevel(SKILL_AXE) --axe
            local skill_axe = -(axe- ArenaVocations[player:getStorageValue(100000002)].axe) 
            skill_bonus:setParameter(CONDITION_PARAM_SKILL_AXE, skill_axe)
            --Sword
            local sword = player:getSkillLevel(SKILL_SWORD) --axe
            local skill_sword = -(sword- ArenaVocations[player:getStorageValue(100000002)].sword) 
            skill_bonus:setParameter(CONDITION_PARAM_SKILL_SWORD, skill_sword)
            --Club
            local club = player:getSkillLevel(SKILL_CLUB) --axe
            local skill_club = -(club- ArenaVocations[player:getStorageValue(100000002)].club) 
            skill_bonus:setParameter(CONDITION_PARAM_SKILL_CLUB, skill_club)
            --Distance
            local distance = player:getSkillLevel(SKILL_DISTANCE) --axe
            local skill_distance = -(distance- ArenaVocations[player:getStorageValue(100000002)].distance) 
            skill_bonus:setParameter(CONDITION_PARAM_SKILL_DISTANCE, skill_distance)
            --Magic Level
            local ml = player:getMagicLevel()
            local magic_level = -(ml - ArenaVocations[player:getStorageValue(100000002)].magiclevel)
            skill_bonus:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, magic_level)
            
            --OUTFIT
            local condition = Condition(CONDITION_OUTFIT)
            condition:setTicks(-1)
            condition:setOutfit(ArenaVocations[player:getStorageValue(100000002)].outfit) --aqui vc coloca o outfit
            player:addCondition(condition)    

            --HP
            local playerhp = player:getMaxHealth()
            local new_hp = -(playerhp- ArenaVocations[player:getStorageValue(100000002)].health)
            skill_bonus:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTS, new_hp)

            --MP
            local playermp = player:getMaxMana()
            local new_mp = -(playermp- ArenaVocations[player:getStorageValue(100000002)].mana)
            skill_bonus:setParameter(CONDITION_PARAM_STAT_MAXMANAPOINTS, new_mp)

            player:addCondition(skill_bonus)
            player:addHealth(player:getMaxHealth())
            player:addMana(player:getMaxMana())

            setArenaItem()
        
    end

end
--função addEvent para timer da arena.

--função arenaClear