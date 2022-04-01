  
local setItems = TalkAction("/setitems")

function setItems.onSay(player, words, param)
    
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

    for index = 1, #ItemSlot do
        
        if player:getSlotItem(ItemSlot[index]) ~= nill and player:getSlotItem(ItemSlot[index]) ~= 0 then
            local item_id = player:getSlotItem(ItemSlot[index]).itemid
            player:setStorageValue(100000028 + index, item_id)
            player:removeItem(item_id, 1)
            
        else
            player:setStorageValue(100000028 + index, 0)
        end

    end

        player:addItem(ArenaVocations[player:getStorageValue(Storage.GladiatorArena.NewVocation)].helmet)
        player:addItem(ArenaVocations[player:getStorageValue(Storage.GladiatorArena.NewVocation)].armor)
        player:addItem(ArenaVocations[player:getStorageValue(Storage.GladiatorArena.NewVocation)].legs)
        player:addItem(ArenaVocations[player:getStorageValue(Storage.GladiatorArena.NewVocation)].boots)
        player:addItem(ArenaVocations[player:getStorageValue(Storage.GladiatorArena.NewVocation)].leftweapon)
        player:addItem(ArenaVocations[player:getStorageValue(Storage.GladiatorArena.NewVocation)].rightshield)
        player:addItem(ArenaVocations[player:getStorageValue(Storage.GladiatorArena.NewVocation)].amulet)
        player:addItem(ArenaVocations[player:getStorageValue(Storage.GladiatorArena.NewVocation)].ring)

end

setItems:separator(" ")
setItems:register()