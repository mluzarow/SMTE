Branch.PostStyle = function()
	return "ScreenProfileLoad"
end

Branch.PostProfileLoad = function()
	-- for now, go straight to selmusic, don't pass go, don't collect C200
	return "ScreenSelectMusic"

	--return "ScreenSelectPlayMode"
end

Branch.GameStart = function()
	-- sm5te is for pros. if they don't have songs installed, they might know it.
	--[[
	if PROFILEMAN:GetNumLocalProfiles() >= 2 then
		return "ScreenSelectProfile"
	end
	--]]
	if ThemePrefs.Get("AutoSetStyle") == false then
		return "ScreenSelectStyle"
	else
		return "ScreenSelectNumPlayers"
	end
end

Branch.AfterGameplay = function()
	local numPlayers = GAMESTATE:GetNumPlayersEnabled()
	if numPlayers == 1 then return "ScreenEvaluation1P"
	elseif numPlayers == 2 then return "ScreenEvaluation2P"
	end

	-- fallback omg wtf are you do!
	return "ScreenEvaluationNormal"
end