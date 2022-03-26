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
        --startBattle()
        return true
    end
 end 
end


--leva players para arena, e chama função setArenaVocation
function startBattle(cid, item, position)
    for index, _ in ipairs(ArenaPlayers) do
        local cid = Game.getStorageValue(ArenaPlayers[index])
        local player = Player(cid)

        --PLayer Storage Stats:
        player:setStorageValue(Storage.GladiatorArena.Health, player:getMaxHealth()) -- HP
        player:setStorageValue(Storage.GladiatorArena.Mana, player:getMaxMana()) -- MP
        player:setStorageValue(Storage.GladiatorArena.Level, player:getLevel()) -- Level
        player:setStorageValue(Storage.GladiatorArena.Experience, player:getExperience()) --Experience
        player:setStorageValue(Storage.GladiatorArena.Vocation, player:getVocation():getId()) -- Vocation
        player:setStorageValue(Storage.GladiatorArena.Looktype, player:getOutfit().lookType) -- Outfit
        player:setStorageValue(Storage.GladiatorArena.Lookhead, player:getOutfit().lookHead) -- Head color
        player:setStorageValue(Storage.GladiatorArena.Lookbody, player:getOutfit().lookBody) -- Body color
        player:setStorageValue(Storage.GladiatorArena.Looklegs, player:getOutfit().lookLegs) -- Legs Color
        player:setStorageValue(Storage.GladiatorArena.Lookfeet, player:getOutfit().lookFeet) -- Feet Color 
        player:setStorageValue(Storage.GladiatorArena.Lookaddons, player:getOutfit().lookAddons) -- Addons
        player:setStorageValue(Storage.GladiatorArena.Shield, player:getSkillLevel(SKILL_SHIELD)) -- Shield
        player:setStorageValue(Storage.GladiatorArena.Shieldprogress, player:getSkillTries(SKILL_SHIELD)) -- Shield %
        player:setStorageValue(Storage.GladiatorArena.Axe, player:getSkillLevel(SKILL_AXE)) -- Axe
        player:setStorageValue(Storage.GladiatorArena.Axeprogress, player:getSkillTries(SKILL_AXE)) -- Axe %
        player:setStorageValue(Storage.GladiatorArena.Sword, player:getSkillLevel(SKILL_SWORD)) -- Sword 
        player:setStorageValue(Storage.GladiatorArena.Swordprogress, player:getSkillTries(SKILL_SWORD)) -- Sword %
        player:setStorageValue(Storage.GladiatorArena.Club, player:getSkillLevel(SKILL_CLUB)) -- Club
        player:setStorageValue(Storage.GladiatorArena.Clubprogress, player:getSkillTries(SKILL_CLUB)) -- Club %
        player:setStorageValue(Storage.GladiatorArena.Distance, player:getSkillLevel(SKILL_DISTANCE)) -- Distance
        player:setStorageValue(Storage.GladiatorArena.Distaceprogress, player:getSkillTries(SKILL_DISTANCE)) -- Distance %
        player:setStorageValue(Storage.GladiatorArena.Magic, player:getMagicLevel()) -- ML
        player:setStorageValue(Storage.GladiatorArena.Magicprogress, player:getManaSpent()) -- ML %
    
        --Player Storage Itens:
        if player:getSlotItem(CONST_SLOT_HEAD) then
        local headItem = player:getSlotItem(CONST_SLOT_HEAD)
        player:setStorageValue(Storage.GladiatorArena.Helmet, headItem.itemid)
        player:removeItem(headItem.itemid, 1)
        else
        player:setStorageValue(Storage.GladiatorArena.Helmet, 0) 
        end
        
        --armor
        if player:getSlotItem(CONST_SLOT_ARMOR) then
        local armorItem = player:getSlotItem(CONST_SLOT_ARMOR)
        player:setStorageValue(Storage.GladiatorArena.Armor, armorItem.itemid)
        player:removeItem(armorItem.itemid, 1)
        else
        player:setStorageValue(Storage.GladiatorArena.Armor, 0)    
        end
        
        --legs
        if player:getSlotItem(CONST_SLOT_LEGS) then
        local legsItem = player:getSlotItem(CONST_SLOT_LEGS)
        player:setStorageValue(Storage.GladiatorArena.Legs, legsItem.itemid)
        player:removeItem(legsItem.itemid, 1)
        else
        player:setStorageValue(Storage.GladiatorArena.Legs, 0)     
        end
        
        --boots
        if player:getSlotItem(CONST_SLOT_FEET) then
        local feetItem = player:getSlotItem(CONST_SLOT_FEET)
        player:setStorageValue(Storage.GladiatorArena.Boots, feetItem.itemid)
        player:removeItem(feetItem.itemid, 1)
        else
        player:setStorageValue(Storage.GladiatorArena.Boots, 0)     
        end
        
        --Wand
        if player:getSlotItem(CONST_SLOT_LEFT) then
        local leftItem = player:getSlotItem(CONST_SLOT_LEFT)
        player:setStorageValue(Storage.GladiatorArena.Weapon, leftItem.itemid)
        player:removeItem(leftItem.itemid, 1)
        else
        player:setStorageValue(Storage.GladiatorArena.Weapon, 0)     
        end
      
        --Shield
        if player:getSlotItem(CONST_SLOT_RIGHT) then
        local shieldItem = player:getSlotItem(CONST_SLOT_RIGHT)
        player:setStorageValue(Storage.GladiatorArena.Shield, shieldItem.itemid)
        player:removeItem(shieldItem.itemid, 1)
        else
        player:setStorageValue(Storage.GladiatorArena.Shield, 0)     
        end
        
        --Amulet
        if player:getSlotItem(CONST_SLOT_NECKLACE) then
        local amuletItem = player:getSlotItem(CONST_SLOT_NECKLACE)
        player:setStorageValue(Storage.GladiatorArena.Amulet, amuletItem.itemid)
        player:removeItem(amuletItem.itemid, 1)
        else
        player:setStorageValue(Storage.GladiatorArena.Amulet, 0)     
        end
       
        --Ring
        if player:getSlotItem(CONST_SLOT_RING) then
        local ringItem = player:getSlotItem(CONST_SLOT_RING)
        player:setStorageValue(Storage.GladiatorArena.Ring, ringItem.itemid)
        player:removeItem(ringItem.itemid, 1)
        else
        player:setStorageValue(Storage.GladiatorArena.Ring, 0)     
        end

        --setArenaVocation()

        player:teleportTo(Position(32369, 32241, 7))
    end

end

--função setArenaVocation
function setArenaVocation(cid, item, position)
    for index = 1, #ArenaPlayers do
        local cid = Game.getStorageValue(ArenaPlayers[index])
        local player = Player(cid)


        for index2 = 1, #ArenaVocations do
            if ArenaVocations[index2] == player:getStorageValue(100000002) then

            local skill_bonus = Condition(CONDITION_ATTRIBUTES)
            skill_bonus:setTicks(-1)        
            local axe = player:getSkillLevel(SKILL_AXE)
            local skill_axe = -(axe- ArenaVocations[index2].axe)
            skill_bonus:setParameter(CONDITION_PARAM_SKILL_AXE, skill_axe)
            skill_bonus:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, ArenaVocations[index2].magiclevel)
            player:addCondition(skill_bonus)

            player:teleportTo(Position(32369, 32241, 7))
            end
            print(ArenaVocations[index2], player:getStorageValue(100000002))
        end
    end

end
--função addEvent para timer da arena.

--função arenaClear