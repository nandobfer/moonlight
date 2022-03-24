local config = {
	duration = 30 -- em segundos
	}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
local condition = Condition(CONDITION_INVISIBLE)
condition:setParameter(CONDITION_PARAM_TICKS, -1)

local spell = Spell("instant")

function spell.onCastSpell(creature, var) -- onCast com verificação de weapon para o Assassin
	local player = creature:getPlayer()
	if not player:getSinWeapons() then
		return false
	else
		local position = player:getPosition()
		local isGhost = not player:isInGhostMode()

		if isGhost then
			player:setGhostMode(isGhost)
			player:sendTextMessage(MESSAGE_HOTKEY_PRESSED, "You are now invisible.")
			player:addCondition(condition)
			position.x = position.x + 1
			player:setStorageValue(Storage_.stealth, 1)
			position:sendMagicEffect(CONST_ME_SMOKE)
        end
		return combat:execute(creature, var)
	end
end

spell:name("Vanish")
spell:words("utana max vid")
spell:group("support")
spell:vocation("assassin;true")
spell:id(45)
spell:cooldown(60 * 1000)
spell:groupCooldown(1 * 1000)
spell:level(40)
spell:mana(0)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
