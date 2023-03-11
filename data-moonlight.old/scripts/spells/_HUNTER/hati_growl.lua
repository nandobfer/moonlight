local combat = Combat()
-- combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_DRAWBLOOD)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))

function onTargetCreature(creature, target)
	return doChallengeCreature(creature, target)
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	local player = creature:getMaster()
	if player:getStorageValue(Storage_.growl) < 1 then
		return false
	else
		return combat:execute(creature, variant)
	end
end

spell:name("hati growl")
spell:words("###100000")
spell:blockWalls(true)
spell:needLearn(true)
spell:register()