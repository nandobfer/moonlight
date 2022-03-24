Storage_ = {

	race = 300000000,
	
	crit = {
		bonus = 200000000,
		chance = 200000001,
		equipment_bonus = 200000002,
		equipment_chance = 200000003,
	},

	-- Classes --
		--Druid
	metamorfose = 100000000,
	bear_bonus_life = 100000001,
	max_mana = 100000002,
	bear_form = 100000003,
	recover_mana = 100000004,
	recover_life = 100000005,
	feral_form = 100000006,
	plant_form = 100000007,
	feral_animal_skin = 100000008,
	manticore_form = 100000009,
	leveledup = 1000000010,
	
		--Assassin
	combo_points = 100000010,
	stealth = 100000011,
	bonus_combo_points = 100000012,
	training_sin = {
		i = 100000013, -- 5% crit at lvl 10
		ii = 100000014, -- 5% crit at lvl 50
		iii = 100000015, -- 5% crit at lvl 100
		iv = 100000016, -- 5% crit at lvl 200
		master_poisoner = 100000017, -- crit from poison regen 5 mana
	},
	
		--Paladin
	protector = 100000020,
	holy_power = 100000021,
	aura = {
		mastery = 100000022,
		concentration = 100000023,
		devotion = 100000024,
		retribution = 100000025,
	},
	
		--Knight
	blood_rage = 100000030,
	
		--Hunter
	lone_wolf = 100000040,
	growl = 100000041,

		--Sorcerer
	elemental_overload = 100000050,
	teleport = {
		thais = 100000051,
		carlin = 100000052,
		venore = 100000053,
		edron = 100000054,
		libertybay = 100000055,
		svargrond = 100000056,
		
	}
	
	
}

Feral_Forms = {
	{name = "Midnight Panther", id = -1},
	{name = "Midnight Panther", id = 1},
	{name = "Gnarlhound", id = 2},
	{name = "Noble Lion", id = 3},
	{name = "Tiger", id = 4},
	{name = "War Wolf", id = 5},
	
}







-- Values extraction function
local function extractValues(tab, ret)
	if type(tab) == "number" then
		table.insert(ret, tab)
	else
		for _, v in pairs(tab) do
			extractValues(v, ret)
		end
	end
end

local benchmark = os.clock()
local extraction = {}
extractValues(Storage, extraction) -- Call function
table.sort(extraction) -- Sort the table
-- The choice of sorting is due to the fact that sorting is very cheap O (n log2 (n))
-- And then we can simply compare one by one the elements finding duplicates in O(n)

-- Scroll through the extracted table for duplicates
if #extraction > 1 then
	for i = 1, #extraction - 1 do
		if extraction[i] == extraction[i+1] then
			Spdlog.warn(string.format("Duplicate storage value found: %d",
				extraction[i]))
			Spdlog.warn(string.format("Processed in %.4f(s)", os.clock() - benchmark))
		end
	end
end