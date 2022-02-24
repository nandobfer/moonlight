local combat = Combat()
-- combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_DRAWBLOOD)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))

function onTargetCreature(creature, target)
	local player = creature:getPlayer()
	for _, summon in ipairs (player:getSummons()) do
		doChallengeCreature(summon, target)
	end
	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	local player = creature:getPlayer()
	if player:getStorageValue(Storage_.growl) < 1 then
		player:setStorageValue(Storage_.growl, 1)
		player:sendTextMessage(MESSAGE_HOTKEY_PRESSED, "Taunt ON")
		return combat:execute(creature, variant)
	else
		player:setStorageValue(Storage_.growl, 0)
		player:sendTextMessage(MESSAGE_HOTKEY_PRESSED, "Taunt OFF")
		return true
	end
end

spell:name("Pet Taunt")
spell:words("utamo taunt")
spell:group("support", "focus")
spell:vocation("hunter;true")
spell:id(133)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000, 2 * 1000)
spell:level(8)
spell:mana(0)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()