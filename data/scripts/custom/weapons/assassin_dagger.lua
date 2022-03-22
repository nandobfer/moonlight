local assassinDagger = MoveEvent()

local x = 0

function assassinDagger.onEquip(player, item, slot)
    if x == 0 then
        local critical = {
            chance = player:getStorageValue(Storage_.crit.equipment_chance),
            bonus = player:getStorageValue(Storage_.crit.equipment_bonus)
        }
        player:setStorageValue(Storage_.crit.equipment_bonus, critical.bonus + 50)
        player:setStorageValue(Storage_.crit.equipment_chance, critical.chance + 15)
        x = x + 1
        return true
    end
    
    return true
end

assassinDagger:id(7404)
assassinDagger:type("equip")
assassinDagger:slot("hand")
assassinDagger:register()

assassinDagger = MoveEvent()

function assassinDagger.onDeEquip(player, item, slot)
    local critical = {
		chance = player:getStorageValue(Storage_.crit.equipment_chance),
		bonus = player:getStorageValue(Storage_.crit.equipment_bonus)
	}
	player:setStorageValue(Storage_.crit.equipment_bonus, critical.bonus - 50)
	player:setStorageValue(Storage_.crit.equipment_chance, critical.chance - 15)
    x = 0
    return true
end

assassinDagger:id(7404)
assassinDagger:type("deequip")
assassinDagger:slot("hand")
assassinDagger:register()