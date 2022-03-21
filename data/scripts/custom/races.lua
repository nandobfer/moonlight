function raceStartUp(player)
    local races = {
        human = humanStartUp(player),
        elf = elfStartUp(player),
        goblin = goblinStartUp(player),
        orc = orcStartUp(player),
        dwarf = dwarfStartUp(player),
    }
end

function Player:getRace()
    local player = self:getPlayer()
    if player:getStorageValue(Storage_.race) == 0 then
        return 'human'
    elseif player:getStorageValue(Storage_.race) == 1 then
        return 'elf'
    elseif player:getStorageValue(Storage_.race) == 2 then
        return 'goblin'
    elseif player:getStorageValue(Storage_.race) == 3 then
        return 'orc'
    elseif player:getStorageValue(Storage_.race) == 4 then
        return 'dwarf'
    else
        return false
    end
end


function raceTown(player)
    local town
    if player:getRace() == 'human' then
        town = Town(8) -- Thais
    elseif player:getRace() == 'elf' then
        town = Town(5) -- Ab'Dendriel
    elseif player:getRace() == 'goblin' then
        town = Town(6) -- Carlin
    elseif player:getRace() == 'orc' then
        town = Town(13) -- Darashia
    elseif player:getRace() == 'dwarf' then
        town = Town(7) -- Kazordoon
    else
        town = Town(8) -- Thais
    end

    player:teleportTo(town:getTemplePosition())
    player:setTown(town)

end

----------- HUMAN -----------

function humanStartUp(player)
    if player:getStorageValue(Storage_.race) ~= 0 then
        return false
    end

end

----------- ELF -----------

function elfStartUp(player)
    if player:getStorageValue(Storage_.race) ~= 1 then
        return false
    end
    -- Elf LookType
    local skin = Condition(CONDITION_OUTFIT)
    skin:setTicks(-1)
    skin:setOutfit(MonsterType('elf'):getOutfit())
    player:addCondition(skin)

    -- Elf distance fightning bonus
    local archer = Condition(CONDITION_ATTRIBUTES)
    local distance = player:getSkillLevel(SKILL_DISTANCE)
    archer:setTicks(-1)
    archer:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 10)
    player:addCondition(archer)
end
----------- GOBLIN -----------

function goblinStartUp(player)
    if player:getStorageValue(Storage_.race) ~= 2 then
        return false
    end

    -- Goblin LookType
    local skin = Condition(CONDITION_OUTFIT)
    skin:setTicks(-1)
    skin:setOutfit(MonsterType('goblin'):getOutfit())
    player:addCondition(skin)
end

----------- ORC

function orcStartUp(player)
    if player:getStorageValue(Storage_.race) ~= 3 then
        return false
    end

    -- Orc LookType
    local skin = Condition(CONDITION_OUTFIT)
    skin:setTicks(-1)
    skin:setOutfit(MonsterType('orc'):getOutfit())
    player:addCondition(skin)
end

----------- DWARF

function dwarfStartUp(player)
    if player:getStorageValue(Storage_.race) ~= 4 then
        return false
    end

    -- Dwarf LookType
    local skin = Condition(CONDITION_OUTFIT)
    skin:setTicks(-1)
    skin:setOutfit(MonsterType('dwarf'):getOutfit())
    player:addCondition(skin)
end