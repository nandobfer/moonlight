-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
		maxlevel = 8,
		multiplier = 50
	}, {
		minlevel = 9,
		maxlevel = 20,
		multiplier = 25
	}, {
		minlevel = 21,
		multiplier = 25
	}
}

skillsStages = {
	{
		minlevel = 10,
		maxlevel = 80,
		multiplier = 3
	}, {
		minlevel = 81,
		multiplier = 2
	}
}

magicLevelStages = {
	{
		minlevel = 0,
		maxlevel = 80,
		multiplier = 3
	}, {
		minlevel = 81,
		multiplier = 2
	}
}
