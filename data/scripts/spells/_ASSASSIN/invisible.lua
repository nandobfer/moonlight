local config = {
	duration = 30 -- em segundos
	}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
--combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
local condition = Condition(CONDITION_INVISIBLE)
condition:setParameter(CONDITION_PARAM_TICKS, -1)

local spell = Spell("instant")

function spell.onCastSpell(creature, var) -- onCast com verificação de weapon para o Assassin
	local player = creature:getPlayer()
	if not player:getSinWeapons() then
		return false
	else
		-- if (player:getStorageValue(100000011) > 0) then -- se estiver invisivel
			-- player:removeCondition(CONDITION_INVISIBLE) -- remove invisibilidade
			-- player:setStorageValue(100000011, 0)
		-- else
			-- if player:getCondition(CONDITION_INFIGHT) then -- se estiver em combate
				-- player:getPosition():sendMagicEffect(CONST_ME_POFF)
				-- player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
		-- "Nao pode ficar invisivel em combate!")

				-- creature:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
				-- return false
			-- else 
				-- player:addCondition(condition) -- fica invisivel
				-- player:setStorageValue(100000011, 1)
			-- end
		-- end
		local position = player:getPosition()
		local isGhost = not player:isInGhostMode()

		player:setGhostMode(isGhost)
		if isGhost then
			player:sendTextMessage(MESSAGE_HOTKEY_PRESSED, "You are now invisible.")
			player:addCondition(condition)
			position.x = position.x + 1
			player:setStorageValue(Storage_.stealth, 1)
			position:sendMagicEffect(CONST_ME_SMOKE)
			
			addEvent(function()
				player:sendTextMessage(MESSAGE_HOTKEY_PRESSED, "You are visible again.")
				player:removeCondition(CONDITION_INVISIBLE)
				position.x = position.x + 1
				player:setStorageValue(Storage_.stealth, 0)
				-- position:sendMagicEffect(CONST_ME_SMOKE)
			end, config.duration * 1000)
		else end
		return combat:execute(creature, var)
	end
end

spell:name("Stealth")
spell:words("utana vid")
spell:group("support")
spell:vocation("assassin;true")
spell:id(45)
spell:cooldown(30 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(15)
spell:mana(20)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
