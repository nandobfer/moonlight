local config = {
	interval = 1000 * 0.4,
	effect_end = CONST_ME_PLANTATTACK,
	effect = CONST_ME_SMALLPLANTS,
	dist = 5
}

local root = Condition(CONDITION_ROOTED)
root:setFormula(0, 0, 0, 0)
root:setTicks(-1)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, config.effect_end)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 8) + 35
	local max = (level / 5) + (maglevel * 13) + 55
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

local function plants(targetid, dist, creatureid, var)
	local target = Creature(targetid)
	local creature = Creature(creatureid)
	if not target then
		return true
	end
	local pos = target:getPosition()
	local posis = {
		{x = pos.x, y = pos.y + dist, z = pos.z},
		{x = pos.x, y = pos.y - dist, z = pos.z},
		{x = pos.x + dist, y = pos.y, z = pos.z},
		{x = pos.x - dist, y = pos.y, z = pos.z}
	}
	
	for index, value in ipairs(posis) do
		local tile = Tile(posis[index])
		tile:getPosition():sendMagicEffect(config.effect)
		if dist > 0 then
			addEvent(plants, config.interval, targetid, dist - 1, creatureid, var)
		else
			-- tile:getPosition():sendMagicEffect(config.effect_end)
			return true
		end
	end
		
end

local function damage(creatureid, var)
	creature = Creature(creatureid)
	combat:execute(creature, var)
	creature:getTarget():removeCondition(CONDITION_ROOTED)
end

function spell.onCastSpell(creature, var)
	creature:getTarget():addCondition(root)
	plants(creature:getTarget():getId(), config.dist, creature:getId(), var)
	addEvent(damage, config.dist * config.interval, creature:getId(), var)
	-- return combat:execute(creature, var)
	return true
end

spell:group("attack", "ultimatestrikes")
spell:id(157)
spell:name("Focused Wrath of Nature")
spell:words("exori gran mas tera")
spell:level(100)
spell:mana(250)
spell:isPremium(true)
spell:range(5)
spell:needTarget(true)
spell:blockWalls(true)
spell:cooldown(60 * 1000)
spell:groupCooldown(2 * 1000, 60 * 1000)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true")
spell:register()