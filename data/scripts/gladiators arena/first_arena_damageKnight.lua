local tilePosition = {x = 32108, y = 32343, z = 7}

local knightTile = MoveEvent()
knightTile:type("stepin")

function knightTile.onStepIn(player, item, position, fromPosition)

if player:isPlayer() then

if item.uid == 65525 or item.uid == 65526 then 
        
local tileItem = Tile(tilePosition):getItemById(1949)

if tileItem then


--salva hp atual na storage
    player:setStorageValue(100000001, player:getMaxHealth()) 


--salva mana atual na storage
    player:setStorageValue(100000002, player:getMaxMana()) 


--Salva Level na Storage / Salva Experiencia na Storage
    player:setStorageValue(100000014, player:getLevel())
    player:setStorageValue(100000015, player:getExperience())

--Salva vocação atual na storage / altera vocação para damage knight
    player:setStorageValue(100000003, player:getVocation():getId())
    player:setVocation(11)

--Função para calculo de exp pro proximo level
    local function getExpForLevel(level)
    level = level - 1
    return ((50 * level * level * level) - (150 * level * level) + (400 * level)) / 3
    end


--Seta level 100

if player:getLevel() < 100 then
    targetLevel = 100
        targetExp = getExpForLevel(targetLevel)
        addExp = targetExp - player:getExperience()
        player:addExperience(addExp, false)
    else
    player:removeExperience(player:getExperience() - getExpForLevel(100), false)
    end

-- Seta Hp/Mana ref. lvl 100
    player:setMaxHealth(1565)
    player:addHealth(player:getMaxHealth())
    player:setMaxMana(550)
    player:addMana(player:getMaxMana())    
    

--Salva Outfit config nas storages / Seta Outifit incendiary sorcerer
    player:setStorageValue(100000004, player:getOutfit().lookType)
    player:setStorageValue(100000005, player:getOutfit().lookHead)
    player:setStorageValue(100000006, player:getOutfit().lookBody)
    player:setStorageValue(100000007, player:getOutfit().lookLegs)
    player:setStorageValue(100000008, player:getOutfit().lookFeet)
    player:setStorageValue(100000009, player:getOutfit().lookAddons)
    player:setOutfit({lookType = 143, lookHead = 97, lookBody = 76, lookLegs = 76, lookFeet = 76, lookAddons = 3})   
        
--Salva Skill (SHIELD) na Storage / Salva Progresso do Skill na Storage / Seta Skill 30
    player:setStorageValue(100000010, player:getSkillLevel(SKILL_SHIELD))
    player:setStorageValue(100000011, player:getSkillTries(SKILL_SHIELD))
    local skill = player:getSkillLevel(SKILL_SHIELD)
    player:setSkillLevel(SKILL_SHIELD, 80)

--Salva Skill (AXE) na Storage / Salva Progresso do Skill na Storage / Seta Skill 120
    player:setStorageValue(100000027, player:getSkillLevel(SKILL_AXE))
    player:setStorageValue(100000028, player:getSkillTries(SKILL_AXE))
    local skill = player:getSkillLevel(SKILL_AXE)
    player:setSkillLevel(SKILL_AXE, 120)


--Salva ML na Storage / Salva progresso do ML na Storage / Seta ML 80
    player:setStorageValue(100000012, player:getMagicLevel())
    player:setStorageValue(100000013, player:getManaSpent())
    player:setMagicLevel(6)



--Identifica o Item Equipado / Salva na Storage / Remove o item / Adiciona o Preset Item
--helmet
if player:getSlotItem(CONST_SLOT_HEAD) then
local headItem = player:getSlotItem(CONST_SLOT_HEAD)
player:setStorageValue(100000016, headItem.itemid)
player:removeItem(headItem.itemid, 1)
else
player:setStorageValue(100000016, 0) 
end
player:addItem(3387)--(Demon Helmet)

--armor
if player:getSlotItem(CONST_SLOT_ARMOR) then
local armorItem = player:getSlotItem(CONST_SLOT_ARMOR)
player:setStorageValue(100000017, armorItem.itemid)
player:removeItem(armorItem.itemid, 1)
else
player:setStorageValue(100000017, 0)    
end
player:addItem(3366)--(Magic Plate Armor)

--legs
if player:getSlotItem(CONST_SLOT_LEGS) then
local legsItem = player:getSlotItem(CONST_SLOT_LEGS)
player:setStorageValue(100000018, legsItem.itemid)
player:removeItem(legsItem.itemid, 1)
else
player:setStorageValue(100000018, 0)     
end
player:addItem(10387) --(Zaoan Legs)

--boots
if player:getSlotItem(CONST_SLOT_FEET) then
local feetItem = player:getSlotItem(CONST_SLOT_FEET)
player:setStorageValue(100000019, feetItem.itemid)
player:removeItem(feetItem.itemid, 1)
else
player:setStorageValue(100000019, 0)     
end
player:addItem(3079)--(boh 2195 - soft 6132)

--Shield
if player:getSlotItem(CONST_SLOT_RIGHT) then
local shieldItem = player:getSlotItem(CONST_SLOT_RIGHT)
player:setStorageValue(100000021, shieldItem.itemid)
player:removeItem(shieldItem.itemid, 1)
else
player:setStorageValue(100000021, 0)     
end
--player:addItem(xxxx)--(No Shield)

--AXE
if player:getSlotItem(CONST_SLOT_LEFT) then
local leftItem = player:getSlotItem(CONST_SLOT_LEFT)
player:setStorageValue(100000020, leftItem.itemid)
player:removeItem(leftItem.itemid, 1)
else
player:setStorageValue(100000020, 0)     
end
player:addItem(8098)--(Demonwing Axe)

--Amulet
if player:getSlotItem(CONST_SLOT_NECKLACE) then
local amuletItem = player:getSlotItem(CONST_SLOT_NECKLACE)
player:setStorageValue(100000022, amuletItem.itemid)
player:removeItem(amuletItem.itemid, 1)
else
player:setStorageValue(100000022, 0)     
end
player:addItem(3055)--(Platinum Amulet)

--Ring
if player:getSlotItem(CONST_SLOT_RING) then
local ringItem = player:getSlotItem(CONST_SLOT_RING)
player:setStorageValue(100000023, ringItem.itemid)
player:removeItem(ringItem.itemid, 1)
else
player:setStorageValue(100000023, 0)     
end
player:addItem(3053)--(Time Ring)

--Backpack With Potions
    --player:addItem(37455)--(Ghost Backpack)
    --player:addItem(7590, 10)--(10x Great Mana potions )
 --local bp = player:addItem(37455)
 --bp:addItem(7590, 10)

--Teleporta para a arena.
    --local playeronePosition = (32087, 32339, 7)
    --local playertwooPosition = (32087, 32341, 7)
if Game.getStorageValue(100000024) < 1 then
    Game.setStorageValue(100000024, 1) --seta arena storage
    player:teleportTo(Position(32087, 32339, 7))
    else 
    Game.setStorageValue(100000024, 0) --seta arena storage
    player:teleportTo(Position(32087, 32341, 7))
end


player:setStorageValue(100000025, 1) --seta death_storage
player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You became an Damage Knight, your new spells are: "Exura Icos", "Utani hurs", "Exori Icos", "Jump", "Exori Gran Icos".')
  
end
end
end
    return true
end

knightTile:uid(65525)
knightTile:register()