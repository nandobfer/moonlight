local returnDawnport = TalkAction("/dawnport")

function returnDawnport.onSay(player, words, param)
	player:changeVocation(VOCATION.ID.NONE)
    player:teleportTo(Town(2):getTemplePosition())
    return true
end

returnDawnport:separator(" ")
returnDawnport:register()