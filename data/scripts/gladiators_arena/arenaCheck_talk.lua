local arenaCheck = TalkAction("/arenacheck")

function arenaCheck.onSay(player, words, param)
	arenaCheck()

	creature:say("Storage 1000000001: "..Game.getStorageValue(1000000001).."")
	creature:say("Storage 1000000002: "..Game.getStorageValue(1000000002).."")
	creature:say("Storage 1000000003: "..Game.getStorageValue(1000000003).."")

	creature:say("Storage 1000000051: "..Game.getStorageValue(1000000051).."")
	creature:say("Storage 1000000052: "..Game.getStorageValue(1000000052).."")
	creature:say("Storage 1000000001: "..Game.getStorageValue(1000000001).."")
	creature:say("Storage 1000000002: "..Game.getStorageValue(1000000002).."")
	return false
end

arenaCheck:separator(" ")
arenaCheck:register()