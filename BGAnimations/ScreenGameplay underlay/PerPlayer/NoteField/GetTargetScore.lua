local player = ...
local pn = ToEnumShortString(player)

-- ---------------------------------------------------------------
-- Finds the top score for the current song (or course) given a player.
local GetTopScore = function(kind)
	if not player or not kind then return end

	local SongOrCourse, StepsOrTrail, scorelist

	if GAMESTATE:IsCourseMode() then
		SongOrCourse = GAMESTATE:GetCurrentCourse()
		StepsOrTrail = GAMESTATE:GetCurrentTrail(player)
	else
		SongOrCourse = GAMESTATE:GetCurrentSong()
		StepsOrTrail = GAMESTATE:GetCurrentSteps(player)
	end

	if kind == "Machine" then
		scorelist = PROFILEMAN:GetMachineProfile():GetHighScoreList(SongOrCourse,StepsOrTrail)
	elseif kind == "Personal" then
		scorelist = PROFILEMAN:GetProfile(player):GetHighScoreList(SongOrCourse,StepsOrTrail)
	end

	if scorelist then
		local topscore = scorelist:GetHighScores()[1]
		if topscore then return topscore:GetPercentDP() end
	end

	return 0
end

-- ---------------------------------------------------------------
-- possible target grades, as defined in ./Scripts/SL-PlayerOptions.lua within TargetScore.Values()
-- { 'C-', 'C', 'C+', 'B-', 'B', 'B+', 'A-', 'A', 'A+', 'S-', 'S', 'S+', '☆', '☆☆', '☆☆☆', '☆☆☆☆', 'Machine best', 'Personal best' }

-- the index of the target score chosen in the PlayerOptions menu
local target_score_option = SL[pn].ActiveModifiers.TargetScore

-- the score that corresponds to the chosen target grade by the player
local target_grade_score = 0

if (target_score_option == "Machine best") then
	-- player set TargetGrade as Machine best
	target_grade_score = GetTopScore("Machine")

elseif (target_score_option == "Personal best") then
	-- player set TargetGrade as Personal best
	target_grade_score = GetTopScore("Personal")
else
	-- player set TargetGrade as a particular score
	-- pull from that option
	target_grade_score = tonumber(SL[pn].ActiveModifiers.TargetScoreNumber) / 100
end

-- if there is no personal/machine score, default to S as target
if target_grade_score == 0 then
	target_grade_score = THEME:GetMetric("PlayerStageStats", "GradePercentTier06")
end

-- ---------------------------------------------------------------

return target_grade_score