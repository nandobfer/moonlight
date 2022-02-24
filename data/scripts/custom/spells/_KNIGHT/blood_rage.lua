local condition = Condition(CONDITION_ATTRIBUTES)
-- condition:setParameter(CONDITION_PARAM_SUBID, 5)
condition:setParameter(CONDITION_PARAM_TICKS, -1)
condition:setParameter(CONDITION_PARAM_SKILL_MELEEPERCENT, 150)
condition:setParameter(CONDITION_PARAM_BUFF_DAMAGERECEIVED, 150)
condition:setParameter(CONDITION_PARAM_DISABLE_DEFENSE, true)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat:addCondition(condition)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local player = creature:getPlayer()
	if not player:getBloodRage() then
		player:setStorageValue(Storage_.blood_rage, 1)
		player:sendTextMessage(MESSAGE_HOTKEY_PRESSED, "Blood Rage ON")
		return combat:execute(creature, var)
	else
		player:setStorageValue(Storage_.blood_rage, 0)
		player:removeCondition(CONDITION_ATTRIBUTES)
		player:sendTextMessage(MESSAGE_HOTKEY_PRESSED, "Blood Rage OFF")
		return true
	end
end

spell:name("Blood Rage")
spell:words("utito tempo")
spell:group("support", "focus")
spell:vocation("knight;true", "elite knight;true", "assassin;true")
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