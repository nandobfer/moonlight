local test = TalkAction("/test")

function test.onSay(player, words, param)

    
    local ItemSlot = {
    CONST_SLOT_HEAD,
    CONST_SLOT_ARMOR,
    CONST_SLOT_LEGS,
    CONST_SLOT_FEET,
    CONST_SLOT_LEFT,
    CONST_SLOT_RIGHT,
    CONST_SLOT_NECKLACE,
    CONST_SLOT_RING
    }

    local vocacoes = {
    --Evil Mage
    [12] = {
        3573, --magician hat
        3567, --blue robe
        645, -- blue legs
        3079, --Boh
        8094, --Wand of Voodoo
        8090, --spellbook of Dark Mysteries
        3055, -- Platinum Amulet
        3053 --Time Ring     
    },
    --Incendiary Mage
    [13] = {
        3573, --magician hat
        3567, --blue robe
        645, -- blue legs
        3079, --Boh
        16115, --Wand of Everblazing
        8090, --spellbook of Dark Mysteries
        3055, -- Platinum Amulet
        3053 --Time Ring  
    },
    --Barbarian
    [14] = { 
        3387, --demon helmet
        3366, --magic plate armor
        10387, -- zaoan legs
        3079, --Boh
        8098, --demonwing axe
        0, --no shield
        3055, -- Platinum Amulet
        3053 --Time Ring      
    }
}

local storageIndex = {
        100000029,
        100000030,
        100000031,
        100000032,
        100000033,
        100000034,
        100000035,
        100000036
}

    for index2 = 1, #ItemSlot do
    local voc = player:getStorageValue(Storage.GladiatorArena.NewVocation)
    local newItem = vocacoes[voc][index2]
        
        if player:getSlotItem(ItemSlot[index2]) ~= nill and player:getSlotItem(ItemSlot[index2]) ~= 0 then
            local item_id = player:getSlotItem(ItemSlot[index2]).itemid
            player:setStorageValue(storageIndex[index2], item_id)
            player:removeItem(item_id, 1)
                        
        else
            player:setStorageValue(storageIndex[index2], 0)
        end
            player:addItem(newItem)

    end

end
test:separator(" ")
test:register()