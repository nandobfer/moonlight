local voices = {
	[23708] = "Au au!",
	[23443] = "Grooaarr!"
}

local transformItems = {
	[2108] = 2109, [2109] = 2108,
	[2334] = 2335, [2335] = 2334,
	[2336] = 2337, [2337] = 2336,
	[2338] = 2339, [2339] = 2338,
	[2340] = 2341, [2341] = 2340,
	[2535] = 2536, [2536] = 2535,
	[2537] = 2538, [2538] = 2537,
	[2539] = 2540, [2540] = 2539,
	[2541] = 2542, [2542] = 2541,
	[2660] = 2661, [2661] = 2660,
	[2662] = 2663, [2663] = 2662,
	[2772] = 2773, [2773] = 2772,
	[2907] = 2908, [2908] = 2907,
	[2909] = 2910, [2910] = 2909,
	[2911] = 2912, [2912] = 2911,
	[2914] = 2915, [2915] = 2914,
	[2917] = 2918, [2918] = 2917,
	[2920] = 2921, [2921] = 2920,
	[2922] = 2923, [2923] = 2922,
	[2924] = 2925, [2925] = 2924,
	[2928] = 2929, [2929] = 2928,
	[2930] = 2931, [2931] = 2930,
	[2934] = 2935, [2935] = 2934,
	[2936] = 2937, [2937] = 2936,
	[2938] = 2939, [2939] = 2938,
	[2977] = 2978, [2978] = 2977,
	[3046] = 3047, [3047] = 3046,
	[3481] = 3482,
	[2062] = 2063, [2063] = 2062,
	[2064] = 2065, [2065] = 2064,
	[2944] = 2945, [2945] = 2944,
	[5812] = 5813, [5813] = 5812,
	[6488] = 6489, [6489] = 6488,
	[7058] = 7059, [7059] = 7058,
	[7856] = 7857, [7857] = 7856,
	[7858] = 7859, [7859] = 7858,
	[7860] = 7861, [7861] = 7860,
	[7862] = 7863, [7863] = 7862,
	[8659] = 8660, [8660] = 8659,
	[8661] = 8662, [8662] = 8661,
	[8663] = 8664, [8664] = 8663,
	[8665] = 8666, [8666] = 8665,
	[8832] = 8833, [8833] = 8832,
	[8834] = 8835, [8835] = 8834,
	[17411] = 17412, [17412] = 17411,
	[20498] = 20497, [20497] = 20498,
	[20500] = 20499, [20499] = 20500,
	[20501] = 20502, [20502] = 20501,
	[20503] = 20504, [20504] = 20503,
	[23438] = 23440, [23440] = 23438, [23439] = 23441, [23441] = 23439, --protectress lamp
	[23434] = 23436, [23436] = 23434, [23435] = 23437, [23437] = 23435, --predador lamp
	[23442] = 23443, [23443] = 23442, --baby dragon
	[23444] = 23445, [23445] = 23444, --hamster wheel
	[23451] = 23452, [23452] = 23451, --cat in a basket
	[23485] = 23486, [23486] = 23485, --barrel
	[23708] = 23709, [23709] = 23708, --dog house
	[23709] = 23697, [23697] = 23708, --dog house
	[20280] = 20281, [20281] = 20280, --beacon
	[22764] = 22765, [22765] = 22764, --ferumbras staff
	[22153] = 22154, [22154] = 22153, --skull
	[24432] = 24433, [24433] = 24432, --parrot
	[24434] = 24436, [24435] = 24434, --skull lamp
	[25212] = 25210, [25211] = 25212, --vengothic lamp
	[26078] = 26079, --spider terrarium
	[26081] = 26083, [26083] = 26081, --hrodmiran weapons rack
	[26084] = 26082, [26082] = 26084, --hrodmiran weapons rack side
	[26171] = 26169, [26172] = 26170, --snake terrarium
	[26173] = 26175, [26174] = 26176, --demon pet
	[27667] = 27668, --light of change empty to red
	[27668] = 27669, --light of change red to green
	[27687] = 27688, [27688] = 27687, --pile of alchemistic books
	[28674] = 28675, [28675] = 28674, --anglerfish lamp
	[28690] = 28691, [28691] = 28690, --baby rotworm
	[28694] = 28695, [28695] = 28694, --fennec
	[27986] = 27988, [27988] = 27986, --bonelord statue
	[27987] = 27989, [27989] = 27987, --bonelord statue
	[27996] = 27998, [27998] = 27996, --scholar bust
	[27997] = 27999, [27999] = 27997, --scholar bust
	[28000] = 28002, [28002] = 28000, --scholar bust
	[28001] = 28003, [28003] = 28001, --scholar bust
	[27669] = 27670, --light of change green to blue
	[27670] = 27667, --light of change blue to empty
	[28920] = 28921, [28921] = 28920, --fluorescent fungi
	[28922] = 28923, [28923] = 28922, --luminescent fungi
	[28924] = 28925, [28925] = 28924, --glowing sulphur fungi
	[28926] = 28927, [28927] = 28926, --gloomy poisonous fungi
	[30237] = 30238, [30238] = 30237, --festive tree
	[30248] = 30249, [30249] = 30248, --festive pyramid
	[31196] = 31197, [31197] = 31196, --crystal lamp
	[31213] = 31215, [31215] = 31213, --idol lamp
	[31214] = 31216, [31216] = 31214, --idol lamp side
	[31681] = 31682, [31682] = 31681, --hedgehog
	[31683] = 31684, [31684] = 31683, --exalted sarcophagus
	[31695] = 31696, [31696] = 31695, --curly hortensis lamp
	[31697] = 31698, [31698] = 31697, --little big flower lamp
	[31704] = 31703, [31703] = 31704, --baby unicorn
	[31674] = 31675, --omniscient owl
}

local transformTo = Action()

function transformTo.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if (voices[item:getId()]) then
		local spectators = Game.getSpectators(fromPosition, false, true, 3, 3)
		for i = 1, #spectators do
			player:say(voices[item:getId()], TALKTYPE_MONSTER_SAY, false, spectators[i], fromPosition)
		end
	end

	item:transform(transformItems[item.itemid])
	item:decay()
	return true
end

for index, value in pairs(transformItems) do
	transformTo:id(index)
end

transformTo:register()