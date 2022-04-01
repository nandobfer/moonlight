  
local resetItems = TalkAction("/resetitems")

function resetItems.onSay(player, words, param)
    
  --Remove item For (teste)
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

    local OldItem = {
        100000029,
        100000030,
        100000031,
        100000032,
        100000033,
        100000034,
        100000035,
        100000036
        }

    for index = 1, #ItemSlot do
        
        if player:getSlotItem(ItemSlot[index]) ~= nill and player:getSlotItem(ItemSlot[index]) ~= 0 then
            local item_id = player:getSlotItem(ItemSlot[index]).itemid
            player:removeItem(item_id, 1)
            player:addItem(player:getStorageValue(OldItem[index]))
        else
            player:addItem(player:getStorageValue(OldItem[index]))
        end

        
    end

end

resetItems:separator(" ")
resetItems:register()