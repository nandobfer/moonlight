  
local resetFila = TalkAction("/resetqueue")

function resetFila.onSay(player, words, param)
    
    for index, value in ipairs(Fila) do
    Game.setStorageValue(Fila[index], 0)
    end

    for index, value in ipairs(ArenaPlayers) do
    Game.setStorageValue(ArenaPlayers[index], 0)
    end

    for index, value in ipairs(ArenaStatus) do
    Game.setStorageValue(ArenaStatus[index], 0)
    end

    return true

end

resetFila:separator(" ")
resetFila:register()