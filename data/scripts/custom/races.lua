local races_id = {human, elf}

function raceStartUp(player)
    local races = {
        human = humanStartUp(player),
        elf = elfStartUp(player),
        goblin = goblinStartUp(player),
        orc = orcStartUp(player),
        dwarf = dwarfStartUp(player),
    }
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