-- Global Storages Definitions --

-- Arena Queue
Fila = {
    1000000001,
    1000000002,
    1000000003,
    1000000004,
    1000000005,
    1000000006,
    1000000007,
    1000000008,
    1000000009,
    1000000010,
    1000000011,
    1000000012,
    1000000013,
    1000000014,
    1000000015,
    1000000016,
    1000000017,
    1000000018,
    1000000019,
    1000000020
}

for index, value in ipairs(Fila) do
    Game.setStorageValue(Fila[index], 0)
end

-- Players One and Twoo
ArenaPlayers = {
    1000000051,
    1000000052
  }

for index, value in ipairs(ArenaPlayers) do
    Game.setStorageValue(ArenaPlayers[index], 0)
end

-- Arena Status

ArenaStatus = {
    1000000050
  }

for index, value in ipairs(ArenaStatus) do
    Game.setStorageValue(ArenaStatus[index], 0)
end

ArenaVocations = {

    --Evil Mage
    [12] = {

        shield = 30,
        axe = 10,
        sword = 10,
        club = 10,
        distance = 10,
        magiclevel = 80,
        health = 645,
        mana = 2850,
        helmet = 3573, --magician hat
        armor = 3567, --blue robe
        legs = 645, -- blue legs
        boots = 3079, --Boh
        leftweapon = 8094, --Wand of Voodoo
        rightshield = 8090, --spellbook of Dark Mysteries
        amulet = 3055, -- Platinum Amulet
        ring = 3053, --Time Ring
        outfit = {lookType = 130, lookHead = 0, lookBody = 114, lookLegs = 114, lookFeet = 114, lookAddons = 3}

    },
    --Incendiary Mage
    [13] = {

        shield = 30,
        axe = 10,
        sword = 10,
        club = 10,
        distance = 10,
        magiclevel = 80,
        health = 645,
        mana = 2850,
        helmet = 3573, --magician hat
        armor = 3567, --blue robe
        legs = 645, -- blue legs
        boots = 3079, --Boh
        leftweapon = 16115, --Wand of Everblazing
        rightshield = 8090, --spellbook of Dark Mysteries
        amulet = 3055, -- Platinum Amulet
        ring = 3053, --Time Ring
        outfit = {lookType = 130, lookHead = 0, lookBody = 94, lookLegs = 94, lookFeet = 94, lookAddons = 3}    
    },
    --Barbarian
    [14] = {

        shield = 60,
        axe = 100,
        sword = 10,
        club = 10,
        distance = 10,
        magiclevel = 9,
        health = 1565,
        mana = 550,
        helmet = 3387, --demon helmet
        armor = 3366, --magic plate armor
        legs = 10387, -- zaoan legs
        boots = 3079, --Boh
        leftweapon = 8098, --demonwing axe
        rightshield = 0, --no shield
        amulet = 3055, -- Platinum Amulet
        ring = 3053, --Time Ring
        outfit = {lookType = 143, lookHead = 97, lookBody = 76, lookLegs = 76, lookFeet = 76, lookAddons = 3}       
    }

}