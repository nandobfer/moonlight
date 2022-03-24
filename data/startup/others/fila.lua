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
    [9] = {

        shield = 30,
        axe = 10,
        sword = 10,
        club = 10,
        distance = 10,
        magiclevel = 80
    },
    --Incendiary Mage
    [10] = {

        shield = 30,
        axe = 10,
        sword = 10,
        club = 10,
        distance = 10,
        magiclevel = 80      
    },
    --Barbarian
    [11] = {

        shield = 60,
        axe = 100,
        sword = 10,
        club = 10,
        distance = 10,
        magiclevel = 9        
    }

}