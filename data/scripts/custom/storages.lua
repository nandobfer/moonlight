Storage_ = {

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
	
		--Assassin
	combo_points = 100000010,
	stealth = 100000011,
	bonus_combo_points = 100000012,
	
		--Paladin
	protector = 100000020,
	holy_power = 100000021,
	
		--Knight
	blood_rage = 100000030,
	
		--Hunter
	lone_wolf = 100000040,
	
		--Sorcerer
	elemental_overload = 100000050,
	teleport = {
		thais = 100000051,
	}
	
	
}

-- Feral_Forms = {
	-- Pantera = "Midnight Panther",
	-- Cao = "Gnarlhound",
	-- Leao = "Noble Lion",
	-- Tigre = "Tiger",
	
-- }

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