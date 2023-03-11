local combat = Combat()
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat2:setArea(createCombatArea(AREA_CIRCLE3X3))

function onTargetCreature(creature, target)
	local master = target:getMaster()
	if target:isMonster() and not master or master and master:isMonster() then
		return false
	end
	
	if target:isNpc() then
		return false
	end
	
	local condition = Condition(CONDITION_ATTRIBUTES)
	condition:setParameter(CONDITION_PARAM_TICKS, 1000 * 1)
	condition:setParameter(CONDITION_PARAM_BUFF_DAMAGERECEIVED, 90)
	condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
	target:addCondition(condition)
	return true
end

function onTargetCreature2(creature, target)
	local master = target:getMaster()
	if target:isMonster() and not master or master and master:isMonster() then
		return false
	end
	
	if target:isNpc() then
		return false
	end
	
	local condition = Condition(CONDITION_ATTRIBUTES)
	condition:setParameter(CONDITION_PARAM_TICKS, 1000 * 1)
	condition:setParameter(CONDITION_PARAM_BUFF_DAMAGERECEIVED, 50)
	condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
	target:addCondition(condition)
	return true
end

local function aura(creatureid, var)
	if Creature(creatureid) and Creature(creatureid):getAura() ~= "devotion" then
		return false
	else
		addEvent(aura, 1000 * 1, creatureid, var)
		if not Creature(creatureid):getAuraMastery() then
			return combat:execute(creatureid, var)
		else
			return combat2:execute(creatureid, var)
		end
	end
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")
combat2:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature2")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	if creature:getAura() ~= "devotion" then
		creature:resetAura()
		creature:setStorageValue(Storage_.aura.devotion, 1)
		return aura(creature:getId(), var)
	else
		return false
	end
end


spell:name("Aura da Devocao")
spell:words("utamo aur devo")
spell:group("support")
spell:vocation("paladin;true", "royal;true")
spell:id(82)
spell:cooldown(10 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(60)
spell:mana(0)
spell:isAggressive(false)
spell:isSelfTarget(true)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
