local assassinDagger = MoveEvent()

function assassinDagger.onEquip(player, item, slot)
    local critical = {
		chance = player:getStorageValue(Storage_.crit.chance),
		bonus = player:getStorageValue(Storage_.crit.bonus)
	}
	player:setStorageValue(Storage_.crit.bonus, critical.bonus + 50)
	player:setStorageValue(Storage_.crit.chance, critical.chance + 15)
end

function assassinDagger.onDeEquip(player, item, slot)
    local critical = {
		chance = player:getStorageValue(Storage_.crit.chance),
		bonus = player:getStorageValue(Storage_.crit.bonus)
	}
	player:setStorageValue(Storage_.crit.bonus, critical.bonus - 50)
	player:setStorageValue(Storage_.crit.chance, critical.chance - 15)
end

assassinDagger:id(7404)
assassinDagger:type("equip")
assassinDagger:register()

