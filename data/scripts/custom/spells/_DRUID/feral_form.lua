local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
    local player = creature:getPlayer()
    creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		
    local form = player:getForm()
	
	--DESTRANSFORMAR
	if form then
		player:removeForm()
	else end

	 -- TRANSFORMAR --
	if form ~= "feral" then
		for index, value in ipairs(Feral_Forms) do
			if Feral_Forms[index].id == player:getStorageValue(Storage_.feral_animal_skin) then
				player:addForm(Feral_Forms[index].name, 500)
			else end
		end
	else end
	
    return true
end

spell:name("Feral Form")
spell:words("utevo feral")
spell:group("support")
spell:vocation("druid;true", "elder druid;true")
spell:id(38)
spell:cooldown(0 * 1000)
spell:groupCooldown(0 * 1000)
spell:level(8)
spell:mana(0)
spell:hasParams(true)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()

-- creature:setMaxHealth(creature:getStorageValue(Storage_.bear_form)) -- seta Hp máximo com valor da storage XXX
-- creature:addHealth(creature:getMaxHealth())