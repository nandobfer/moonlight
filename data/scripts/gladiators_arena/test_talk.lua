local test = TalkAction("/test")

function test.onSay(player, words, param)

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


     local voc = player:getStorageValue(Storage.GladiatorArena.NewVocation)
     for index = 1, #vocacoes[voc] do
        local newItem = vocacoes[voc][index]
        player:addItem(newItem)
    end

end
test:separator(" ")
test:register()