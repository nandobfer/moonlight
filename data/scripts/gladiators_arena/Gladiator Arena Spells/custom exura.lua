local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(player, level, magicLevel) -- already compared to the official tibia | compared date: 05/07/19(m/d/y)
	local min = (level * 0.2 + magicLevel * 3.184) + 20
	local max = (level * 0.2 + magicLevel * 5.59) + 35
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")
local mute = Condition(CONDITION_MUTED)
mute:setParameter(CONDITION_PARAM_TICKS, 4000)

function spell.onCastSpell(creature, variant)
	if not creature:getCondition(CONDITION_MUTED) then
	
	creature:say("Storage 1000000001: "..Game.getStorageValue(1000000001).."")
	creature:say("Storage 1000000002: "..Game.getStorageValue(1000000002).."")
	creature:say("Storage 1000000003: "..Game.getStorageValue(1000000003).."")

	--arenaCheck()
	--setArenaVocation()
	--startBattle()
	--resetItem()
	
	return combat:execute(creature, variant)
	else
    creature:sendCancelMessage("You are Still Silenced.")
    end
end

spell:name("Light Healing")
spell:words("exuras")
spell:group("healing")
spell:vocation()
spell:id(8703)
spell:cooldown(1000)
spell:groupCooldown(1000)
spell:level(8)
spell:mana(0)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()