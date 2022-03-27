local arenaCheck = TalkAction("/arenacheck")

function arenaCheck.onSay(player, words, param)
	arenaCheck()

	player:say("Storage 1000000001: "..Game.getStorageValue(1000000001).."")
	player:say("Storage 1000000002: "..Game.getStorageValue(1000000002).."")
	player:say("Storage 1000000003: "..Game.getStorageValue(1000000003).."")

	player:say("Storage 1000000051: "..Game.getStorageValue(1000000051).."")
	player:say("Storage 1000000052: "..Game.getStorageValue(1000000052).."")
	player:say("Storage 1000000001: "..Game.getStorageValue(1000000001).."")
	player:say("Storage 1000000002: "..Game.getStorageValue(1000000002).."")
	return false
end

arenaCheck:separator(" ")
arenaCheck:register()