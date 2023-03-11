local changeRace = TalkAction("/race")

function changeRace.onSay(player, words, param)
	-- if not player:getGroup():getAccess() then
		-- return true
	-- end

	-- if player:getAccountType() < ACCOUNT_TYPE_GOD then
		-- return false
	-- end

	local split = param:split(",")
	if split[2] == nil then
		player:sendCancelMessage("Insufficient parameters.")
		return false
	end

	local target = Player(split[1])
	if target == nil then
		player:sendCancelMessage("A player with that name is not online.")
		return false
	end

	-- Trim left
	split[2] = split[2]:gsub("^%s*(.-)$", "%1")

	local race = split[2]
	player:setStorageValue(Storage_.race, race)
    doPlayerSendTextMessage(player:getId(), MESSAGE_EVENT_ADVANCE, "Race of " .. target:getName() .. " changed to " .. race .. "")
	return false
end

changeRace:separator(" ")
changeRace:register()