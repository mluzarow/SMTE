local Center1P = PREFSMAN:GetPreference("Center1Player")
local numPlayers = GAMESTATE:GetNumPlayersEnabled()
local numSides = GAMESTATE:GetNumSidesJoined()

local function FilterAlpha(pn)
	local ut = GetUserTable(pn)
	if ut then
		if not ut.Global then ut.Global = {} end
		if not ut.Global.ScreenFilter then
			ut.Global.ScreenFilter = 0
		end
		return ut.Global.ScreenFilter
	else
		local envName = "ScreenFilter"..pname(pn)
		local val = getenv(envName)
		if val then return val end
		return 0
	end
end

local function FilterX(pn)
	if Center1P and numPlayers == 1 then return SCREEN_CENTER_X end

	local p = (numPlayers == 1) and "OnePlayer" or "TwoPlayers"
	local s = (numSides == 1) and "OneSide" or "TwoSides"
	Trace("Player"..pname(pn)..p..s.."X")
	return THEME:GetMetric("ScreenGameplay","Player"..pname(pn)..p..s.."X")
end

-- xxx: this makes a lot of assumptions
local function FilterWidth()
	local style = GAMESTATE:GetCurrentStyle()
	--local styleType = style:GetStyleType()
	local colsPlayer = style:ColumnsPerPlayer()

	return colsPlayer*64
end

local function MakeFilter(pn)
	return Def.Quad{
		InitCommand=function(self)
			self:x( FilterX(pn) )
			self:CenterY()
			self:zoomx(FilterWidth())
			self:zoomy(SCREEN_HEIGHT)
			self:diffuse(color("0,0,0,"..FilterAlpha(pn)))
		end,
	}
end

return Def.ActorFrame{
	MakeFilter(PLAYER_1),
	MakeFilter(PLAYER_2)
}