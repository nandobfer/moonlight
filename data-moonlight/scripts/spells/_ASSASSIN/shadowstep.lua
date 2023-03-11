local function teleport(creature)
	local player = creature:getPlayer()
	local target = player:getTarget()
	local me = CONST_ME_BLACKSMOKE
	
	local pos = target:getPosition()
	player:getPosition():sendMagicEffect(me)
	player:teleportTo(pos)
	pos:sendMagicEffect(me)
	return true
end

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	if not creature:getSinWeapons() then
		return false
	else
		teleport(creature)
		return true
	end
end

spell:name("Shadow Step")
spell:words("exani step")
spell:group("support")
spell:vocation("assassin;true")
spell:id(81)
spell:cooldown(10 * 1000)
spell:groupCooldown(0 * 1000)
spell:level(50)
spell:mana(0)
spell:hasParams(false)
spell:isAggressive(false)
spell:needTarget(true)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
