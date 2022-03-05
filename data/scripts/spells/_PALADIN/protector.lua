local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local spell = Spell("instant")

-- aura que taunta a cada 1 segundo
local combat_taunt = Combat()
combat_taunt:setArea(createCombatArea(AREA_SQUARE1X1))
function onTargetCreature(creature, target)
	return doChallengeCreature(creature, target)
end
combat_taunt:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local function taunt(creatureid, variant)
	if Creature(creatureid):getStorageValue(Storage_.protector) < 1 then
		return false
	else
		addEvent(taunt, 1000, creatureid, variant)
		return combat_taunt:execute(Creature(creatureid), variant)
	end
end
-- fim da aura

local function protector(player, variant)
	if player:getStorageValue(Storage_.protector) < 1 then
		player:setStorageValue(Storage_.protector, 1)
		local condition = Condition(CONDITION_ATTRIBUTES)
		condition:setParameter(CONDITION_PARAM_TICKS, -1)
		condition:setParameter(CONDITION_PARAM_SKILL_SHIELDPERCENT, 220)
		condition:setParameter(CONDITION_PARAM_BUFF_DAMAGEDEALT, 65)
		condition:setParameter(CONDITION_PARAM_BUFF_DAMAGERECEIVED, 85)
		condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
		player:addCondition(condition)
		taunt(player:getId(), variant)
		player:sendTextMessage(MESSAGE_HOTKEY_PRESSED, "Protector ON")
	else
		player:setStorageValue(Storage_.protector, 0)
		player:removeCondition(CONDITION_ATTRIBUTES)
		player:setBaseCritical()
		player:sendTextMessage(MESSAGE_HOTKEY_PRESSED, "Protector OFF")
	end
end

function spell.onCastSpell(creature, variant)
	local player = creature:getPlayer()
	protector(player, variant)
	return combat:execute(creature, variant)
end

spell:name("Protector")
spell:words("utamo tempo")
spell:group("support", "focus")
spell:vocation("paladin;true", "royal paladin;true")
spell:id(132)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000, 2 * 1000)
spell:level(20)
spell:mana(0)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
