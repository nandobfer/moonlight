local combat = Combat()
-- combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
-- combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setArea(createCombatArea(AREA_SQUARE1X1))

function onTargetCreature(creatureid, target)
	local master = target:getMaster()
	if master and not master:isMonster() then
		return false
	end
	if not target:isMonster() then
		return false
	end
	
	doTargetCombatHealth(0, target, COMBAT_HOLYDAMAGE, -Creature(creatureid):getLevel()/2, -Creature(creatureid):getLevel()*1.5, CONST_ME_HOLYDAMAGE)

	return true
end

local function aura(creatureid, var)
	if Creature(creatureid):getAura() ~= "retribution" then
		return false
	else
		addEvent(aura, 1000 * 2, creatureid, var)
		return combat:execute(creatureid, var)
	end
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

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
