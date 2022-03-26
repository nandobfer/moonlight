local arenaCheck = TalkAction("/arenacheck")

function arenaCheck.onSay(player, words, param)
	arenaCheck()
	return false
end

arenaCheck:separator(" ")
arenaCheck:register()