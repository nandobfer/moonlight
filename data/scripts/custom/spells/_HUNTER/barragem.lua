local config = {
	interval = 100,
	attacks = 15
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ONYXARROW)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)

function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()
	
	local min = (level / 5) + ((skill + 25) / 3) / 5 + 10
	local max = (level / 5) + (skill + 25) / 5 + 20

	return -min, -max
end

function tiroRapido(combat, creatureid, var, i)
	local creature = Creature(creatureid)
	combat:execute(creature, var)
	-- if i < (creature:getSkillLevel(SKILL_DISTANCE) / 5) then
	if i < attacks then
		i = i + 1
		addEvent(tiroRapido, config.interval, combat, creature:getId(), var, i)
	else
		return true
	end
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local i = 0 
	tiroRapido(combat, creature:getId(), var, i)
	return true
end

spell:group("attack")
spell:id(112)
spell:name("Barragem")
spell:words("exori max con")
spell:level(100)
spell:mana(50)
spell:isPremium(true)
spell:range(7)
spell:needTarget(true)
spell:blockWalls(true)

spell:cooldown(45 * 1000)
spell:groupCooldown(1 * 1000)
spell:needLearn(false)
spell:vocation("hunter;true")
spell:register()