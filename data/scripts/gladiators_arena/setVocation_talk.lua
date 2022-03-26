local setArenaVocation = TalkAction("/setarenavocation")

function setArenaVocation.onSay(player, words, param)
	setArenaVocation()
	return false
end

setArenaVocation:separator(" ")
setArenaVocation:register()