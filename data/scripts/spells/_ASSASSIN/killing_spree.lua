local config = {
    effect = CONST_ME_POFF,     --Efeito.
    interval = 250    --Intervalo, em milésimos de segundo, entre os teleportes.
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)

function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()	
	local min = (level / 5) + (skill + attack) / 3
	local max = (level / 5) + skill + attack
	
	-- player, tipo, multiplier, duracao
	applyDot(player, player:getTarget(), "poison", 0.3, 5)
	
	return -min / 2, -max / 2 -- TODO : Use New Real Formula instead of an %
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function killingSpree(playerid, targetid, positions, original_position, creatureid, var)
	local player = Creature(playerid)
	local target = Creature(targetid)
	local creature = Creature(creatureid)
	if #positions < 1 or not target then
		player:teleportTo(original_position)
		player:removeCondition(CONDITION_ROOTED)
		player:getPosition():sendMagicEffect(config.effect)
		player:addComboPoints(1)
		return true
	else end
	local index = math.random(#positions)
	local toPos = positions[index]
	-- if not isWalkable then funtion until is walkable
	if not isWalkable(toPos) then
		repeat
			 table.remove(positions, index)
            index = math.random(#positions)
            toPos = positions[index]
			if #positions < 1 then
				player:teleportTo(original_position)
				player:removeCondition(CONDITION_ROOTED)
				player:getPosition():sendMagicEffect(config.effect)
				player:addComboPoints(1)
				return true
			end
		until isWalkable(toPos)
	end
	
	player:teleportTo(toPos)
	player:getPosition():sendMagicEffect(config.effect)
	combat:execute(creature, var)
	table.remove(positions, index)
	addEvent(killingSpree, config.interval, player:getId(), target:getId(), positions, original_position, creature:getId(), var)
end

function spell.onCastSpell(creature, var)
	local player = creature:getPlayer()
	local target = player:getTarget()
	if not player:getSinWeapons() then
		return false
	else
		player:removeStealth()
		
		local root = Condition(CONDITION_ROOTED)
		root:setFormula(0, 0, 0, 0)
		root:setTicks(-1)
		player:addCondition(root)
		local pos = target:getPosition()
		local posis = {
			{x = pos.x + 1, y = pos.y + 1, z = pos.z},
			{x = pos.x, y = pos.y + 1, z = pos.z},
			{x = pos.x + 1, y = pos.y, z = pos.z},
			{x = pos.x + 1, y = pos.y - 1, z = pos.z},
			{x = pos.x - 1, y = pos.y + 1, z = pos.z},
			{x = pos.x - 1, y = pos.y, z = pos.z},
			{x = pos.x - 1, y = pos.y - 1, z = pos.z},
			{x = pos.x, y = pos.y - 1, z = pos.z}
		}
		killingSpree(player:getId(), target:getId(), posis, player:getPosition(), creature:getId(), var)
		
		return true
	end
end

spell:group("attack")
spell:id(112)
spell:name("Killing Spree")
spell:words("exori max sin")
spell:level(100)
spell:mana(50)
spell:isPremium(true)
spell:range(5)
spell:needTarget(true)
spell:blockWalls(true)
spell:needWeapon(true)
spell:cooldown(30 * 1000)
spell:groupCooldown(1 * 1000)
spell:needLearn(false)
spell:vocation("assassin;true")
spell:register()