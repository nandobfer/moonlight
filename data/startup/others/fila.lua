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

ItemSlot = {
    CONST_SLOT_HEAD,
    CONST_SLOT_ARMOR,
    CONST_SLOT_LEGS,
    CONST_SLOT_FEET,
    CONST_SLOT_LEFT,
    CONST_SLOT_RIGHT,
    CONST_SLOT_NECKLACE,
    CONST_SLOT_RING
    }

StorageIndex = {
    100000029,
    100000030,
    100000031,
    100000032,
    100000033,
    100000034,
    100000035,
    100000036
}

ArenaVocations = {

    --Evil Mage
    [12] = {
        3573, --magician hat
        3567, --blue robe
        645, -- blue legs
        3079, --Boh
        8094, --Wand of Voodoo
        8090, --spellbook of Dark Mysteries
        3055, -- Platinum Amulet
        3053, --Time Ring
        lvl = 100,
        shield = 30,
        axe = 10,
        sword = 10,
        club = 10,
        distance = 10,
        magiclevel = 80,
        health = 645,
        mana = 2850,
        spells = 'You became an Evil Mage, your new spells are: "Exuras", "Utani Hurs", "Exori Morts", "Exevo Mort Hur", "Exori Max Mort".',
        outfit = {lookType = 130, lookHead = 0, lookBody = 114, lookLegs = 114, lookFeet = 114, lookAddons = 3}

    },
    --Incendiary Mage
    [13] = {
        3573, --magician hat
        3567, --blue robe
        645, -- blue legs
        3079, --Boh
        16115, --Wand of Everblazing
        8090, --spellbook of Dark Mysteries
        3055, -- Platinum Amulet
        3053, --Time Ring  
        lvl = 100,
        shield = 30,
        axe = 10,
        sword = 10,
        club = 10,
        distance = 10,
        magiclevel = 80,
        health = 645,
        mana = 2850,
        spells = 'You became an Incendiary Mage, your new spells are: "Exuras", "Utani hurs", "Exori Flams", "Exevo Flam Hurs", "Exevo Gran Mas Flams".',
        outfit = {lookType = 130, lookHead = 0, lookBody = 94, lookLegs = 94, lookFeet = 94, lookAddons = 3}    
    },
    --Barbarian
    [14] = {
        3387, --demon helmet
        3366, --magic plate armor
        10387, -- zaoan legs
        3079, --Boh
        8098, --demonwing axe
        0, --no shield
        3055, -- Platinum Amulet
        3053, --Time Ring 
        lvl = 100,
        shield = 60,
        axe = 100,
        sword = 10,
        club = 10,
        distance = 10,
        magiclevel = 9,
        health = 1565,
        mana = 550,
        spells = 'You became a Barbarian, your new spells are: "Exura Icos", "Utani hurs", "Exori Grans", "Jump", "Exori Gran Icos".',
        outfit = {lookType = 143, lookHead = 0, lookBody = 94, lookLegs = 94, lookFeet = 114, lookAddons = 3}       
    },
    --Warrior
    [15] = {
        3369, --Warrior Helmet
        11686, --Royal Draken mail
        10387, -- zaoan legs
        3079, --Boh
        3288, --Magic sword
        3422, --Great Shield
        3055, -- Platinum Amulet
        3053, --Time Ring
        lvl = 100,
        shield = 90,
        axe = 10,
        sword = 90,
        club = 10,
        distance = 10,
        magiclevel = 9,
        health = 1565,
        mana = 550,
        spells = 'You became a Warrior, your new spells are: "Exura Icos", "Utani tempo hurs", "Exoris", "Exori Mins", "Exori Grans".',
        outfit = {lookType = 134, lookHead = 0, lookBody = 114, lookLegs = 114, lookFeet = 114, lookAddons = 3} 
    },
    --Tank
    [16] = {
        3365, --Golden Helmet
        3366, --Magic Plate Armor
        3364, -- Golden Legs
        3555, --Golden Boots
        3309, --Thunder Hammer
        3423, --Blessed Shield
        3055, -- Platinum Amulet
        3053, --Time Ring
        lvl = 100,
        shield = 110,
        axe = 10,
        sword = 10,
        club = 85,
        distance = 10,
        magiclevel = 9,
        health = 1565,
        mana = 550,
        spells = 'You became a Tank, your new spells are: "Exura Icos", "Exura Med Icos", "Utani Hurs", "Utamo Tempos", "Jump Mas".',
        outfit = {lookType = 516, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 95, lookAddons = 3} 
    },
    --Archer
    [17] = {
        11689, --Elite Draken Helmet
        8060, --Master Archer Armor
        8863, -- Yalahari Leg Piece
        3079, --Boh
        8028, --Yols Bow
        35562, --Quiver
        3055, -- Platinum Amulet
        3053, --Time Ring
        lvl = 100,
        shield = 10,
        axe = 10,
        sword = 10,
        club = 10,
        distance = 110,
        magiclevel = 17,
        health = 1105,
        mana = 1470,
        spells = 'You became an Archer, your new spells are: "Exuras", "Exori Cons", "Utani Hurs", "Utito Tempo Sans", "Exori Gran Con".',
        outfit = {lookType = 129, lookHead = 0, lookBody = 63, lookLegs = 63, lookFeet = 115, lookAddons = 3} 
    },
    --Spearman
    [18] = {
        3368, --Winged Helmet
        8057, --Divine Plate
        8863, -- Yalahari Leg Piece
        3079, --Boh
        21158, --Gloth Spear
        3423, --Blessed Shield
        3055, -- Platinum Amulet
        3053, --Time Ring
        lvl = 100,
        shield = 90,
        axe = 10,
        sword = 10,
        club = 10,
        distance = 100,
        magiclevel = 17,
        health = 1105,
        mana = 1470,
        spells = 'You became an Spearman, your new spells are: "Exura Sans", "Exura Gran Sans", "Utani Hurs", "Exori Sans", "Exevo Mas Sans".',
        outfit = {lookType = 268, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookAddons = 3} 
    },
    --Ice Mage
    [19] = {
        3573, --magician hat
        3567, --blue robe
        645, -- blue legs
        3079, --Boh
        16118, --Glacial Rod
        8090, --spellbook of Dark Mysteries
        3055, -- Platinum Amulet
        3053, --Time Ring
        lvl = 100,
        shield = 30,
        axe = 10,
        sword = 10,
        club = 10,
        distance = 10,
        magiclevel = 80,
        health = 645,
        mana = 2850,
        spells = 'You became an Ice Mage, your new spells are: "Exuras", "Exura Sios", "Exori Frigos", "Exevo Gran Frigo Hurs", "Exevo Gran Mas Frigos".',
        outfit = {lookType = 130, lookHead = 0, lookBody = 10, lookLegs = 9, lookFeet = 11, lookAddons = 3}    
    },
    --Earth Mage
    [20] = {
        3573, --magician hat
        3567, --blue robe
        645, -- blue legs
        3079, --Boh
        16117, --Muck Rod
        8090, --spellbook of Dark Mysteries
        3055, -- Platinum Amulet
        3053, --Time Ring
        lvl = 100,
        shield = 30,
        axe = 10,
        sword = 10,
        club = 10,
        distance = 10,
        magiclevel = 80,
        health = 645,
        mana = 2850,
        spells = 'You became an Earth Mage, your new spells are: "Exuras", "Exura Sios", "Exori Teras", "Exevo Tera Hurs", "Exevo Gran Mas Pox".',
        outfit = {lookType = 130, lookHead = 0, lookBody = 120, lookLegs = 121, lookFeet = 116, lookAddons = 3}    
    }

}