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

--Função para calculo da Experience a remover
    local function getExpForLevel(level)
    level = level - 1
    return ((50 * level * level * level) - (150 * level * level) + (400 * level)) / 3
    end

-- Função para resetar o level do player
    if player:getStorageValue(100000014) < 100 then
    player:removeExperience(player:getExperience() - getExpForLevel(player:getStorageValue(100000014)), false)
   else
    targetLevel = player:getStorageValue(100000014)
        targetExp = getExpForLevel(targetLevel)
        addExp = targetExp - player:getExperience()
        player:addExperience(addExp, false)
end

--Função para resetar o HP do Player
    player:setMaxHealth(player:getStorageValue(100000001))
    player:addHealth(player:getMaxHealth())

--Função para resetar a Mana do Player
    player:setMaxMana(player:getStorageValue(100000002))
    player:addMana(player:getMaxMana())

--Reseta vocação do player
    player:setVocation(player:getStorageValue(100000003))

--Reseta Outfit do player
    player:setOutfit({lookType = (player:getStorageValue(100000004)),lookHead = (player:getStorageValue(100000005)),
    lookBody = (player:getStorageValue(100000006)),lookLegs = (player:getStorageValue(100000007)),
    lookFeet = (player:getStorageValue(100000008)),lookAddons = (player:getStorageValue(100000009))})
  
--Reseta Skill (AXE) do player / reseta progresso do Fist
    player:setSkillLevel(SKILL_AXE, player:getStorageValue(100000027))
    player:addSkillTries(SKILL_AXE, player:getStorageValue(100000028))

--Reseta Skill (SHIELD) do player / reseta progresso do Fist
    player:setSkillLevel(SKILL_SHIELD, player:getStorageValue(100000010))
    player:addSkillTries(SKILL_SHIELD, player:getStorageValue(100000011))


--Reseta ML do Player / Reseta Progresso do ML 
    player:setMagicLevel(player:getStorageValue(100000012))
    player:addManaSpent(player:getStorageValue(100000013))

--Identifica o Iten Equipado / Remove o Iten / Repoe o Iten se salvo na Storage
--helmet
local headItem = player:getSlotItem(CONST_SLOT_HEAD)
if headItem then
player:removeItem(headItem.itemid, 1)
player:addItem(player:getStorageValue(100000016))
end

--armor
local armorItem = player:getSlotItem(CONST_SLOT_ARMOR)
if armorItem then
player:removeItem(armorItem.itemid, 1)
player:addItem(player:getStorageValue(100000017))
end

--legs
local legsItem = player:getSlotItem(CONST_SLOT_LEGS)
if legsItem then
player:removeItem(legsItem.itemid, 1)
player:addItem(player:getStorageValue(100000018))
end

--boots
local feetItem = player:getSlotItem(CONST_SLOT_FEET)
if feetItem then
player:removeItem(feetItem.itemid, 1)
player:addItem(player:getStorageValue(100000019))
end

--Hand
local leftItem = player:getSlotItem(CONST_SLOT_LEFT)
if leftItem then
player:removeItem(leftItem.itemid, 1)
player:addItem(player:getStorageValue(100000020))
end

--Shield
local shieldItem = player:getSlotItem(CONST_SLOT_RIGHT)
if shieldItem then
player:removeItem(shieldItem.itemid, 1)
player:addItem(player:getStorageValue(100000021))
end

--Amulet
local amuletItem = player:getSlotItem(CONST_SLOT_NECKLACE)
if amuletItem then
player:removeItem(amuletItem.itemid, 1)
player:addItem(player:getStorageValue(100000022))
end

--Ring
local ringItem = player:getSlotItem(CONST_SLOT_RING)
if ringItem then
player:removeItem(ringItem.itemid, 1)
player:addItem(player:getStorageValue(100000023))
end



--Cure Burning
player:removeCondition(CONDITION_FIRE)


local specs, spec = Game.getSpectators(Position(32087, 32340, 7), false, false, 8, 8, 8, 8)
	for i = 1, #specs do
		spec = specs[i]
		if spec:isPlayer() then
			spec:teleportTo(Position(32369, 32241, 7))
			spec:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			spec:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You Lose')
		elseif spec:isMonster() then
			spec:remove()
		end
	end

--Aciona animação do Teleport
    Game.setStorageValue(100000026, 0)
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)


end			
end
end
end
	return true
end

stair:uid(65533)
stair:register()