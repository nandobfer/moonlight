local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	local player = creature:getPlayer()
	local root = Condition(CONDITION_ROOTED)
	root:setFormula(0, 0, 0, 0)
	root:setTicks(-1)
	player:addCondition(root)
	local pacify = Condition(CONDITION_PACIFIED)
	pacify:setTicks(-1)
	
	for i = 1, 9, 1 do
		addEvent(function()
		player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
		player:addMana(player:getMaxMana() * 0.05)
		end, i * 1000)
	end
	
	addEvent(function()
		player:addMana(player:getMaxMana() * 0.05)
		player:removeCondition(CONDITION_ROOTED)
		player:removeCondition(CONDITION_PACIFIED)
		end, 10 * 1000)

	return true
end

spell:name("Evocation")
spell:words("utamo ev")
spell:group("support")
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:id(82)
spell:cooldown(60 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(20)
spell:mana(0)
spell:hasParams(true)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
