local startBattle = TalkAction("/startbattle")

function startBattle.onSay(player, words, param)
	startBattle()
	return false
end

startBattle:separator(" ")
startBattle:register()