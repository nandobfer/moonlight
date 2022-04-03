local test = TalkAction("/test")

function test.onSay(player, words, param)

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

end
test:separator(" ")
test:register()