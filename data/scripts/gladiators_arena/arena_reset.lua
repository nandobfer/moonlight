local stairPosition = {x = 32369, y = 32241, z = 7}

local stair = MoveEvent()
stair:type("stepin")

function stair.onStepIn(player, item, position, fromPosition)

if player:isPlayer() then

if item.uid == 65533 then 
		
local stairsItem = Tile(stairPosition):getItemById(410)
if stairsItem then


if player:getStorageValue(100000025) ~= nill and player:getStorageValue(100000025) == 1 then

    player:setStorageValue(100000025, 0)

--Cure Burning
player:removeCondition(CONDITION_FIRE)

    --Remove Skill Condition
    player:removeCondition(CONDITION_ATTRIBUTES)
    --Remove Outfit Condition
    player:removeCondition(CONDITION_OUTFIT)
    --Reset Arena Storage
    player:setStorageValue(Storage.GladiatorArena.Arena, 0)
    --Reset Vocation
    player:setVocation(player:getStorageValue(Storage.GladiatorArena.OldVocation))
    
    --Reset Level
                --Função para calculo de exp pro proximo level
            local function getExpForLevel(level)
            level = level - 1
            return ((50 * level * level * level) - (150 * level * level) + (400 * level)) / 3
            end

    if player:getLevel() < player:getStorageValue(Storage.GladiatorArena.Level) then
    targetLevel = player:getStorageValue(Storage.GladiatorArena.Level)
    targetExp = getExpForLevel(targetLevel)
    addExp = targetExp - player:getExperience()
    player:addExperience(addExp, false)
    else
    player:removeExperience(player:getExperience() - getExpForLevel(player:getStorageValue(Storage.GladiatorArena.Level)), false)
    end

    --Remove item For (teste)
    local ItemSlot = {
        CONST_SLOT_HEAD,
        CONST_SLOT_ARMOR,
        CONST_SLOT_LEGS,
        CONST_SLOT_FEET,
        CONST_SLOT_LEFT,
        CONST_SLOT_RIGHT,
        CONST_SLOT_NECKLACE,
        CONST_SLOT_RING
        }

    local OldItem = {
        100000029,
        100000030,
        100000031,
        100000032,
        100000033,
        100000034,
        100000035,
        100000036
        }

    for index = 1, #ItemSlot do
        
        if player:getSlotItem(ItemSlot[index]) ~= nill and player:getSlotItem(ItemSlot[index]) ~= 0 then
            local item_id = player:getSlotItem(ItemSlot[index]).itemid
            player:removeItem(item_id, 1)
            player:addItem(player:getStorageValue(OldItem[index]))
        else
            player:addItem(player:getStorageValue(OldItem[index]))
        end

        
    end


--Aciona animação do Teleport
player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

--Chama Outro Player de volta da Arena
if Game.getStorageValue(ArenaStatus[1]) == 1 then
    Game.setStorageValue(ArenaStatus[1], 0)
    Game.setStorageValue(ArenaPlayers[1], 0)
    Game.setStorageValue(ArenaPlayers[2], 0)
local specs, spec = Game.getSpectators(Position(32087, 32340, 7), false, false, 8, 8, 8, 8)
	for i = 1, #specs do
		spec = specs[i]
		if spec:isPlayer() then
			spec:teleportTo(Position(32369, 32241, 7))
			spec:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			spec:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You Win')
		elseif spec:isMonster() then
			spec:remove()
		end
	end
end

end			
end
end
end
	return true
end

stair:uid(65533)
stair:register()