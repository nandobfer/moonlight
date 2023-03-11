local spell = Spell("instant")

local function removeMastery(playerid)
	Creature(playerid):setStorageValue(Storage_.aura.mastery, 0)
	return true
end

function spell.onCastSpell(creature, var)
	if creature:getAura() then
		creature:setStorageValue(Storage_.aura.mastery, 1)
		addEvent(removeMastery, 1000 * 10, creature:getId())
		return true
	else
		return false
	end
end

spell:group("support")
spell:id(107)
spell:name("Aura Mastery")
spell:words("utamo aur max")
spell:level(20)
spell:mana(50)
spell:isPremium(true)
spell:blockWalls(true)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("paladin;true")
spell:register()