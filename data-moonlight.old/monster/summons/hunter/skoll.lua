local mType = Game.createMonsterType("Skoll")
local monster = {}

monster.description = "Skoll, a spiritual beast"
monster.experience = 0
monster.outfit = {
	lookType = 716,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 400
monster.maxHealth = 500
monster.race = "undead"
monster.corpse = 0
monster.speed = 600
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 20
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = false,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -0, maxDamage = -40},
	--{name ="combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -30, maxDamage = -120, range = 5, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_STONES, target = true},
	--{name ="combat", interval = 2000, chance = 5, type = COMBAT_ENERGYDAMAGE, minDamage = -90, maxDamage = -150, length = 2, spread = 0, effect = CONST_ME_GROUNDSHAKER, target = false},
	{name ="hati growl", interval = 2000, chance = 100, target = false}
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 60, maxDamage = 60, effect = CONST_ME_MAGIC_GREEN, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 50},
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = 50},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 50},
	{type = COMBAT_MANADRAIN, percent = 50},
	{type = COMBAT_DROWNDAMAGE, percent = 50},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = 50},
	{type = COMBAT_DEATHDAMAGE , percent = 50}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
