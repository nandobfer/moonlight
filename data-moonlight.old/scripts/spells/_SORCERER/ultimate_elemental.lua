local config = {
	range = 6,
	duration = 10 * 1000,
	
	iceBarrier = {
		effect = 6707,
	},
	
	fireNova = {
		effect = CONST_ME_FIREAREA,
	},
	
	lightningStorm = {
		effect = CONST_ME_BIGCLOUDS,
		interval = 125,
	},
}

local combat_ice = Combat()
combat_ice:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat_ice:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
combat_ice:setArea(createCombatArea(AREA_CIRCLE_BORDER6X6))

local combat_fire1 = Combat()
combat_fire1:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat_fire1:setParameter(COMBAT_PARAM_EFFECT, config.fireNova.effect)
combat_fire1:setArea(createCombatArea(AREA_FIRE_1))

local combat_fire2 = Combat()
combat_fire2:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat_fire2:setParameter(COMBAT_PARAM_EFFECT, config.fireNova.effect)
combat_fire2:setArea(createCombatArea(AREA_FIRE_2))

local combat_fire3 = Combat()
combat_fire3:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat_fire3:setParameter(COMBAT_PARAM_EFFECT, config.fireNova.effect)
combat_fire3:setArea(createCombatArea(AREA_FIRE_3))

local combat_fire4 = Combat()
combat_fire4:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat_fire4:setParameter(COMBAT_PARAM_EFFECT, config.fireNova.effect)
combat_fire4:setArea(createCombatArea(AREA_FIRE_4))

local combat_fire5 = Combat()
combat_fire5:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat_fire5:setParameter(COMBAT_PARAM_EFFECT, config.fireNova.effect)
combat_fire5:setParameter(COMBAT_PARAM_CREATEITEM, ITEM_FIREFIELD_PVP_FULL)
combat_fire5:setArea(createCombatArea(AREA_FIRE_5))


function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 5)
	local max = (level / 5) + (maglevel * 16)
	return -min, -max
end

function onGetFormulaValues1(player, level, maglevel)
	local min = (level / 5) + (maglevel * 5)
	local max = (level / 5) + (maglevel * 16)
	return -min / 4, -max / 4
end

function onGetFormulaValues2(player, level, maglevel)
	local min = (level / 5) + (maglevel * 5)
	local max = (level / 5) + (maglevel * 16)
	return -min / 4, -max / 4
end

function onGetFormulaValues3(player, level, maglevel)
	local min = (level / 5) + (maglevel * 5)
	local max = (level / 5) + (maglevel * 16)
	return -min / 4, -max / 4
end

function onGetFormulaValues4(player, level, maglevel)
	local min = (level / 5) + (maglevel * 5)
	local max = (level / 5) + (maglevel * 16)
	return -min / 4, -max / 4
end

function onGetFormulaValues5(player, level, maglevel)
	local min = (level / 5) + (maglevel * 5)
	local max = (level / 5) + (maglevel * 16)
	return -min / 4, -max / 4
end

combat_ice:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
combat_fire1:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues1")
combat_fire2:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues2")
combat_fire3:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues3")
combat_fire4:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues4")
combat_fire5:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues5")

local spell = Spell("instant")

local function iceBarrier(playerid, var)

	local duration = config.duration
	local object = config.iceBarrier.effect

	local player = Creature(playerid)
	-- local cpos = player:getPosition()
	-- local dir = {
		-- [0] = {object, from = {x=cpos.x-1, y=cpos.y-1, z=cpos.z}, to = {x=cpos.x+1, y=cpos.y-1, z=cpos.z}}, -- North (cima)
		-- [1] = {object, from = {x=cpos.x+1, y=cpos.y-1, z=cpos.z}, to = {x=cpos.x+1, y=cpos.y+1, z=cpos.z}}, -- East (direita)
		-- [2] = {object, from = {x=cpos.x-1, y=cpos.y+1, z=cpos.z}, to = {x=cpos.x+1, y=cpos.y+1, z=cpos.z}}, -- South (baixo)
		-- [3] = {object, from = {x=cpos.x-1, y=cpos.y-1, z=cpos.z}, to = {x=cpos.x-1, y=cpos.y+1, z=cpos.z}}, -- West (esquerda)
	-- }
	-- local getDir = dir[player:getDirection()]
	-- for x = getDir.from.x, getDir.to.x do
		-- for y = getDir.from.y, getDir.to.y do
			-- local pos = {x=x,y=y,z=cpos.z}
			-- Game.createItem(getDir[1], 1, pos)
			-- addEvent(function()
				-- local tile = Tile(pos)
				-- if tile:getItemById(getDir[1]) then
					-- tile:getItemById(getDir[1]):remove()
				-- end
			-- end, duration*1000)
		-- end
	-- end
	
	local pos = player:getPosition()
	local pos2 = player:getPosition()
	
	for i = config.range, 0, -1 do
		
		local barrier = {
			Game.createItem(object, 1, {x = pos.x, y = pos.y + i, z = pos.z}),
			Game.createItem(object, 1, {x = pos.x + 1, y = pos.y + i, z = pos.z}),
			Game.createItem(object, 1, {x = pos.x, y = pos.y - i, z = pos.z}),
			Game.createItem(object, 1, {x = pos.x + 1, y = pos.y - i, z = pos.z}),
			Game.createItem(object, 1, {x = pos2.x, y = pos.y + i, z = pos.z}),
			Game.createItem(object, 1, {x = pos2.x - 1, y = pos.y + i, z = pos.z}),
			Game.createItem(object, 1, {x = pos2.x, y = pos.y - i, z = pos.z}),
			Game.createItem(object, 1, {x = pos2.x - 1, y = pos.y - i, z = pos.z})
		}

		addEvent(function()	
			for index, _ in ipairs(barrier) do
				barrier[index]:remove()
				combat_ice:execute(player, var)
			end
		end, duration)
		pos.x = pos.x + 1
		pos2.x = pos2.x - 1
	end
	
	return true
end

local function fireNova1(playerid, var)
	local player = Creature(playerid)
	combat_fire1:execute(player, var)
end

local function fireNova2(playerid, var)
	local player = Creature(playerid)
	combat_fire2:execute(player, var)
end

local function fireNova3(playerid, var)
	local player = Creature(playerid)
	combat_fire3:execute(player, var)
end

local function fireNova4(playerid, var)
	local player = Creature(playerid)
	combat_fire4:execute(player, var)
end

local function fireNova5(playerid, var)
	local player = Creature(playerid)
	combat_fire5:execute(player, var)
end

local function lightningStorm(playerid, pos)
	local player = Creature(playerid)
	
	if #pos < 1 then
		return true
	end
	local level = player:getLevel()
	local maglevel = player:getMagicLevel()
	local min = ((level / 5) + (maglevel * 5)) / 5
	local max = (level / 5) + (maglevel * 5) * 2
	local index = math.random(#pos)
	local newPos = pos[index]
	local tile = Tile(newPos)
	tile:getPosition():sendMagicEffect(config.lightningStorm.effect)
	table.remove(pos, index)
	enemy = tile:getTopCreature()
	if enemy then
		doTargetCombatHealth(0, enemy, COMBAT_ENERGYDAMAGE, -min, -max, config.lightningStorm.effect)
	end
	addEvent(lightningStorm, config.lightningStorm.interval, playerid, pos)
end

local function fireEvent(playerid, var)
	local player = Creature(playerid)
	addEvent(fireNova1, 750, playerid, var)
	addEvent(fireNova2, 900, playerid, var)
	addEvent(fireNova3, 1050, playerid, var)
	addEvent(fireNova4, 1200, playerid, var)
	addEvent(fireNova5, 1350, playerid, var)
end

local function iceEvent(creature, var)
	combat_ice:execute(creature, var)
	addEvent(iceBarrier, 500, creature:getId(), var)
end

local function lightningEvent(playerid, var)
	local player = Creature(playerid)
	local pos_i = player:getPosition()
	local pos = {

		{x = pos_i.x, y = pos_i.y, z = pos_i.z},
		{x = pos_i.x, y = pos_i.y + 1, z = pos_i.z},
		{x = pos_i.x, y = pos_i.y + 2, z = pos_i.z},
		{x = pos_i.x, y = pos_i.y + 3, z = pos_i.z},
		{x = pos_i.x, y = pos_i.y + 4, z = pos_i.z},
		{x = pos_i.x, y = pos_i.y + 5, z = pos_i.z},
		{x = pos_i.x, y = pos_i.y - 1, z = pos_i.z},
		{x = pos_i.x, y = pos_i.y - 2, z = pos_i.z},
		{x = pos_i.x, y = pos_i.y - 3, z = pos_i.z},
		{x = pos_i.x, y = pos_i.y - 4, z = pos_i.z},
		{x = pos_i.x, y = pos_i.y - 5, z = pos_i.z},
		
			-- lado direito
			
		{x = pos_i.x + 1, y = pos_i.y, z = pos_i.z},
		{x = pos_i.x + 1, y = pos_i.y + 1, z = pos_i.z},
		{x = pos_i.x + 1, y = pos_i.y + 2, z = pos_i.z},
		{x = pos_i.x + 1, y = pos_i.y + 3, z = pos_i.z},
		{x = pos_i.x + 1, y = pos_i.y + 4, z = pos_i.z},
		{x = pos_i.x + 1, y = pos_i.y - 1, z = pos_i.z},
		{x = pos_i.x + 1, y = pos_i.y - 2, z = pos_i.z},
		{x = pos_i.x + 1, y = pos_i.y - 3, z = pos_i.z},
		{x = pos_i.x + 1, y = pos_i.y - 4, z = pos_i.z},
		
		{x = pos_i.x + 2, y = pos_i.y, z = pos_i.z},
		{x = pos_i.x + 2, y = pos_i.y + 1, z = pos_i.z},
		{x = pos_i.x + 2, y = pos_i.y + 2, z = pos_i.z},
		{x = pos_i.x + 2, y = pos_i.y + 3, z = pos_i.z},
		{x = pos_i.x + 2, y = pos_i.y - 1, z = pos_i.z},
		{x = pos_i.x + 2, y = pos_i.y - 2, z = pos_i.z},
		{x = pos_i.x + 2, y = pos_i.y - 3, z = pos_i.z},
		
		{x = pos_i.x + 3, y = pos_i.y, z = pos_i.z},
		{x = pos_i.x + 3, y = pos_i.y + 1, z = pos_i.z},
		{x = pos_i.x + 3, y = pos_i.y + 2, z = pos_i.z},
		{x = pos_i.x + 3, y = pos_i.y - 1, z = pos_i.z},
		{x = pos_i.x + 3, y = pos_i.y - 2, z = pos_i.z},
		
		{x = pos_i.x + 4, y = pos_i.y, z = pos_i.z},
		{x = pos_i.x + 4, y = pos_i.y + 1, z = pos_i.z},
		{x = pos_i.x + 4, y = pos_i.y - 1, z = pos_i.z},
		
		{x = pos_i.x + 5, y = pos_i.y, z = pos_i.z},
		
			-- lado esquerdo

		{x = pos_i.x - 1, y = pos_i.y, z = pos_i.z},
		{x = pos_i.x - 1, y = pos_i.y + 1, z = pos_i.z},
		{x = pos_i.x - 1, y = pos_i.y + 2, z = pos_i.z},
		{x = pos_i.x - 1, y = pos_i.y + 3, z = pos_i.z},
		{x = pos_i.x - 1, y = pos_i.y + 4, z = pos_i.z},
		{x = pos_i.x - 1, y = pos_i.y - 1, z = pos_i.z},
		{x = pos_i.x - 1, y = pos_i.y - 2, z = pos_i.z},
		{x = pos_i.x - 1, y = pos_i.y - 3, z = pos_i.z},
		{x = pos_i.x - 1, y = pos_i.y - 4, z = pos_i.z},
		
		{x = pos_i.x - 2, y = pos_i.y, z = pos_i.z},
		{x = pos_i.x - 2, y = pos_i.y + 1, z = pos_i.z},
		{x = pos_i.x - 2, y = pos_i.y + 2, z = pos_i.z},
		{x = pos_i.x - 2, y = pos_i.y + 3, z = pos_i.z},
		{x = pos_i.x - 2, y = pos_i.y - 1, z = pos_i.z},
		{x = pos_i.x - 2, y = pos_i.y - 2, z = pos_i.z},
		{x = pos_i.x - 2, y = pos_i.y - 3, z = pos_i.z},
		
		{x = pos_i.x - 3, y = pos_i.y, z = pos_i.z},
		{x = pos_i.x - 3, y = pos_i.y + 1, z = pos_i.z},
		{x = pos_i.x - 3, y = pos_i.y + 2, z = pos_i.z},
		{x = pos_i.x - 3, y = pos_i.y - 1, z = pos_i.z},
		{x = pos_i.x - 3, y = pos_i.y - 2, z = pos_i.z},
		
		{x = pos_i.x - 4, y = pos_i.y, z = pos_i.z},
		{x = pos_i.x - 4, y = pos_i.y + 1, z = pos_i.z},
		{x = pos_i.x - 4, y = pos_i.y - 1, z = pos_i.z},
		
		{x = pos_i.x - 5, y = pos_i.y, z = pos_i.z},
	}
	addEvent(lightningStorm, 1350, player:getId(), pos)
end

function spell.onCastSpell(creature, var)
	local creatureid = creature:getId()
	-- tryElementalOverload(combat_ice, creature, var)
	iceEvent(creature, var)
	fireEvent(creature:getId(), var)
	lightningEvent(creature:getId(), var)
	addEvent(lightningEvent, 300, creature:getId(), var)
	addEvent(lightningEvent, 600, creature:getId(), var)
	
	local root = Condition(CONDITION_ROOTED)
	root:setFormula(0, 0, 0, 0)
	root:setTicks(-1)
	creature:addCondition(root)
	addEvent(function()
		Creature(creatureid):removeCondition(CONDITION_ROOTED)
	end, config.duration + 500)
	return true
end

spell:group("attack", "focus")
spell:id(119)
spell:name("Ice Fridge")
spell:words("exevo gran mas el")
spell:level(100)
spell:mana(4000)
spell:isSelfTarget(true)
spell:isPremium(true)
spell:cooldown(90 * 1000)
spell:groupCooldown(4 * 1000, 40 * 1000)
spell:needLearn(false)
spell:vocation("sorcerer;true", "master sorcerer;true")
spell:register()