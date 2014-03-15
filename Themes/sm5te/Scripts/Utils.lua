function TECreditsMessage(pn,_str)
	if SCREENMAN:GetTopScreen() then
		if SCREENMAN:GetTopScreen():GetName() == "ScreenProfileLoad" then
			_str = "- Loading -"
		else
			if _str == "" and GAMESTATE:IsSideJoined(pn) then
				_str = "(No Profile)"
			end
		end
	end

	return _str
end

-- do you know how often I get sick of doing this shit
function SongOrCourse()
	if GAMESTATE:IsCourseMode() then return GAMESTATE:GetCurrentCourse()
	else return GAMESTATE:GetCurrentSong()
	end
end

function StepsOrTrail(pn)
	if GAMESTATE:IsCourseMode() then return GAMESTATE:GetCurrentTrail(pn)
	else return GAMESTATE:GetCurrentSteps(pn)
	end
end
-- it's a lot. really.

function OppositePlayer(pn)
	if pn == 'PlayerNumber_P1' then
		return 'PlayerNumber_P2'
	elseif pn == 'PlayerNumber_P2' then
		return 'PlayerNumber_P1'
	end
end

local numMusicQuotes = 10
function GetRandomSelMusicQuote()
	local subtextItem = string.format("Subtext%d",math.random(1,numMusicQuotes))
	return THEME:GetString("ScreenSelectMusic",subtextItem)
end

-- xxx: does this properly check for player profiles in all situations?
function GetPlayerProfile(pn)
	if PROFILEMAN:IsPersistentProfile(pn) then
		return PROFILEMAN:GetProfile(pn);
	end;
	return nil
end;

function PlayerValue(pn,p1,p2) return (pn == PLAYER_1) and p1 or p2 end

function GetJudgeLevelNumber() return GetTimingDifficulty()+3 end
function GetLifeLevelNumber() return GetLifeDifficulty()+3 end

--[[
function GenerateStyleList(numPlayers)
	local styles = GAMEMAN:GetStepsTypesForGame(GAMESTATE:GetCurrentGame():GetName())
	if styles then
		-- ok cool we have styles
		for k,v in pairs(styles) do
			Trace(string.format("[%s] %s",k,v))
		end
	else
		-- no styles for current game
	end
end
--]]