local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat2:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat2:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat2:setArea(createCombatArea(AREA_CIRCLE3X3))

function onTargetCreature(creature, target)
	local master = target:getMaster()
	if target:isMonster() and not master or master and master:isMonster() then
		return false
	end
	
	if target:isNpc() then
		return false
	end
	
	if target then
		target:addMana(20)
	end
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
	
	if target then
		target:addMana(20)
		local condition = Condition(CONDITION_REGENERATION)
		condition:setTicks(1000 * 10)
		condition:setParameter(CONDITION_PARAM_HEALTHGAIN, target:getMaxHealth() * 0.05)
		condition:setParameter(CONDITION_PARAM_HEALTHTICKS, 1000 * 1)
		target:addCondition(condition)
	end
	return true
end

local function aura(creatureid, var)
	if Creature(creatureid) and Creature(creatureid):getAura() ~= "concentration" then
		return false
	else
		addEvent(aura, 1000 * 10, creatureid, var)
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
	if creature:getAura() ~= "concentration" then
		creature:resetAura()
		creature:setStorageValue(Storage_.aura.concentration, 1)
		return aura(creature:getId(), var)
	else
		return false
	end
end


spell:name("Aura da Concentracao")
spell:words("utamo aur conc")
spell:group("support")
spell:vocation("paladin;true", "royal;true")
spell:id(82)
spell:cooldown(10 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(40)
spell:mana(0)
spell:isAggressive(false)
spell:isSelfTarget(true)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
