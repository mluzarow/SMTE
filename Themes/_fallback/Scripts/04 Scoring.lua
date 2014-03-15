-- TOURNAMENT EDITION FALLBACK SCORING SYSTEMS FILE

--internals table
local Shared = {};
--Special Scoring types.
Scoring = {};
--the following metatable makes any missing value in a table 0 instead of nil.
local ZeroIfNotFound = { __index = function() return 0 end; };

-- Retrieve the amount of taps/holds/rolls involved. Used for some formulas.
function GetTotalItems(radars)
	local total = radars:GetValue('RadarCategory_TapsAndHolds')
	total = total + radars:GetValue('RadarCategory_Holds') 
	total = total + radars:GetValue('RadarCategory_Rolls')
	-- [ja] Liftを加えると一部二重加算になるため除外する。
	-- total = total + radars:GetValue('RadarCategory_Lifts')

	if total <= 0 then
		total = 1
	end;
	return total
end;

-- Get the radar values directly. The individual steps aren't used much.
function GetDirectRadar(player)
	return GAMESTATE:GetCurrentSteps(player):GetRadarValues(player);
end;

-- ========================================================================== --
-- begin scoring system zone
------------------------------------------------------------
-- MIGS (Marvelous Incorporated Grading System)
-- one of the recognized scoring systems.
------------------------------------------------------------
local migsTnsMult =
{
	['TapNoteScore_W1']		= 3,
	['TapNoteScore_W2']		= 2,
	['TapNoteScore_W3']		= 1,
	['TapNoteScore_W5']		= -4,
	['TapNoteScore_Miss']	= -8,
}
local migsHeldMult = 6

Scoring['MIGS'] = function(params,pss)
	local curScore = 0;
	for tns,mult in pairs(migsTnsMult) do
		curScore = curScore + ( pss:GetTapNoteScores(tns) * mult );
	end;
	curScore = curScore + ( pss:GetHoldNoteScores('HoldNoteScore_Held') * migsHeldMult )
	curScore = math.max(0,curScore);
	pss:SetScore(curScore);
end;

------------------------------------------------------------
-- DP-marv
-- <Staiain> i use dp-marv to determine world records on my wiki
-- original source: http://www.staiain.net/StepMania/DP-M%20compare.html
------------------------------------------------------------
-- this may end up being a display thing, since it can be calculated after the fact
--[[
local dpmTnsMult =
{
	['TapNoteScore_W1']			= 2,
	['TapNoteScore_W2']			= 1.8,
	['TapNoteScore_W3']			= 1,
	['TapNoteScore_W5']			= -4,
	['TapNoteScore_Miss']		= -8,
	['TapNoteScore_HitMine']	= -8
}
local dpmHeldMult = 6

Scoring['DP-marv'] = function(params,pss)
	local dpm = 0;

	-- tap note scores
	for tns,mul in pairs(dpmTnsMult) do
		dpm = dpm + (pss:GetTapNoteScores(tns) * mul)
	end
	-- hold note scores
	dpm = dpm + (pss:GetHoldNoteScores('HoldNoteScore_Held') * dpmHeldMult)

	dpm = math.max(0,dpm)

	pss:SetScore(dpm);
end;
--]]

------------------------------------------------------------
-- freemScore
-- someone's on drugs and it's freem.
-- this is an unrecognized scoring system, used for my own
-- personal amusement. if it ever gets adopted as "legit",
-- then god help us all. (lol) -f
------------------------------------------------------------
--[[
local freemTnsMult = {
	['TapNoteScore_W1']			= 4,
	['TapNoteScore_W2']			= 3,
	['TapNoteScore_W3']			= 2,
	['TapNoteScore_W4']			= 1,
	['TapNoteScore_W5']			= 0,
	['TapNoteScore_Miss']		= -2,
	['TapNoteScore_HitMine']	= -2,
}

local freemHnsMult = {
	['HoldNoteScore_Held']	= 2,
	['HoldNoteScore_LetGo']	= -2,
}

Scoring['freemScore'] = function(params,pss)
	local fScore = 0

	local actualDP = pss:GetActualDancePoints()
	local possibleDP = pss:GetPossibleDancePoints()
	Trace( string.format("actual/possible %f/%f",actualDP,possibleDP) )

	-- tap note scores
	for tns,mul in pairs(freemTnsMult) do
		fScore = fScore + (pss:GetTapNoteScores(tns) * mul)
	end
	-- hold note scores
	for tns,mul in pairs(freemHnsMult) do
		fScore = fScore + (pss:GetTapNoteScores(tns) * mul)
	end

	math.max(0,fScore) -- no negative scores
	Trace( string.format("fscore %f",fScore) )

	pss:SetScore(fScore)
end
--]]
-- end scoring system zone
-- ========================================================================== --

function UserPrefScoringMode()
	local baseChoices = {}
	for k,v in pairs(Scoring) do table.insert(baseChoices,k) end
	if next(baseChoices) == nil then UndocumentedFeature "No scoring modes available" end
	local t = {
		Name = "UserPrefScoringMode";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = baseChoices;
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("UserPrefScoringMode") ~= nil then
				--Load the saved scoring mode from UserPrefs.
				local theValue = ReadPrefFromFile("UserPrefScoringMode");
				local success = false; 
				--Search the list of scoring modes for the saved scoring mode.        
				for k,v in ipairs(baseChoices) do if v == theValue then list[k] = true success = true break end end;
				--We couldn't find it, pick the first available scoring mode as a sane default.
				if success == false then list[1] = true end;
			else
				WritePrefToFile("UserPrefScoringMode", baseChoices[1]);
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			for k,v in ipairs(list) do if v then WritePrefToFile("UserPrefScoringMode", baseChoices[k]) break end end;
		end;
	};
	setmetatable( t, t );
	return t;
end
