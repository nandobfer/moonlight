local tilePosition = {x = 32360, y = 32239, z = 7}

local tile = MoveEvent()
tile:type("stepin")

function tile.onStepIn(player, item, position, fromPosition)

if player:isPlayer() then

if item.uid == 65531 then 
		
local tileItem = Tile(tilePosition):getItemById(409)
local arenaStorage = Game.getStorageValue(100000026) --testa vocation_arena_storage

    local function clearArena()
    local specs, spec = Game.getSpectators(Position(32111, 32340, 7), false, false, 8, 8, 8, 8)
        for i = 1, #specs do
        spec = specs[i]
            if spec:isPlayer() then
                spec:teleportTo(Position(32369, 32241, 7))
                spec:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
                spec:say("Time out! You were teleported out by strange forces.", TALKTYPE_MONSTER_SAY)
                Game.setStorageValue(100000026, 0)
            end
        end
    end

if tileItem then

if arenaStorage ~= nill and arenaStorage == 2 then

--Arena Cheia
    player:sendCancelMessage("Yout must wait until the end of the battle.")

    elseif arenaStorage == 1 then

--Player Dois
    player:teleportTo(Position(32111, 32334, 7))
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    Game.setStorageValue(100000026, 2)

    stopEvent(Game.getStorageValue(100000029))

else

--Player Um
    player:teleportTo(Position(32111, 32346, 7))
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    Game.setStorageValue(100000026, 1) --seta vocation_arena_storage

   --local event = addEvent(clearArena, 10 * 1000)
   Game.setStorageValue(100000029, addEvent(clearArena, 10 * 1000))

end

--end			
end
end
end
	return true
end

tile:uid(65531)
tile:register()