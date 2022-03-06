local combat = Combat()
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat:setArea(createCombatArea(AREA_SQUARE1X1))

local combat2 = Combat()
combat2:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat2:setArea(createCombatArea(AREA_CIRCLE3X3))

function onTargetCreature(creatureid, target)
	local master = target:getMaster()
	if master and not master:isMonster() then
		return false
	end
	if not target:isMonster() then
		return false
	end
	
	local min = -Creature(creatureid):getLevel() / 2
	local max = -Creature(creatureid):getLevel() * 1.5
	
	doTargetCombatHealth(0, target, COMBAT_HOLYDAMAGE, min, max, CONST_ME_HOLYDAMAGE)

	return true
end

function onTargetCreature2(creatureid, target)
	local master = target:getMaster()
	if master and not master:isMonster() then
		return false
	end
	if not target:isMonster() then
		return false
	end
	
	local min = -Creature(creatureid):getLevel() / 2
	local max = -Creature(creatureid):getLevel() * 1.5
	
	doTargetCombatHealth(0, target, COMBAT_HOLYDAMAGE, min * 2, max * 2, CONST_ME_HOLYDAMAGE)
	
	Creature(creatureid):getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
	return true
end

local function aura(creatureid, var)
	if Creature(creatureid) and Creature(creatureid):getAura() ~= "retribution" then
		return false
	else
		addEvent(aura, 1000 * 2, creatureid, var)
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
	if creature:getAura() ~= "retribution" then
		creature:resetAura()
		creature:setStorageValue(Storage_.aura.retribution, 1)
		return aura(creature:getId(), var)
	else
		return false
	end
end


spell:name("Aura da Retribuicao")
spell:words("utamo aur ret")
spell:group("attack")
spell:vocation("paladin;true", "royal;true")
spell:id(82)
spell:cooldown(10 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(20)
spell:mana(0)
spell:isAggressive(true)
spell:isSelfTarget(true)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
