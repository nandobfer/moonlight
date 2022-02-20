local spell = Spell("instant")

local corpse = Condition(CONDITION_OUTFIT)
corpse:setOutfit({lookTypeEx = 3058})
local root = Condition(CONDITION_ROOTED)
root:setFormula(0, 0, 0, 0)
local pacify = Condition(CONDITION_PACIFIED)
local aggro = Condition(CONDITION_INVISIBLE)

local duration = -1
corpse:setTicks(duration)
root:setTicks(duration)
pacify:setTicks(duration)
aggro:setTicks(duration)


local immunity = Condition(CONDITION_ATTRIBUTES)
immunity:setTicks(duration)
immunity:setParameter(CONDITION_PARAM_BUFF_DAMAGERECEIVED, 1)

function spell.onCastSpell(creature, variant)
	local player = creature:getPlayer()
	
	if not player:getCondition(CONDITION_OUTFIT) then
		-- player:addCondition(aggro)
		player:addCondition(corpse)
		player:addCondition(root)
		player:addCondition(pacify)
		player:addCondition(immunity)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	else
		-- player:removeCondition(CONDITION_INVISIBLE)
		player:removeCondition(CONDITION_OUTFIT)
		player:removeCondition(CONDITION_ROOTED)
		player:removeCondition(CONDITION_PACIFIED)
		player:removeCondition(CONDITION_ATTRIBUTES)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		
		
	end
	return true
end

spell:name("Fingir de Morto")
spell:words("utamo mort")
spell:group("support", "focus")
spell:vocation("hunter;true")
spell:id(133)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000, 2 * 1000)
spell:level(20)
spell:mana(0)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()