local judgeFont = "_smallcaps 8px"

local labelYOffset = {
	RadarCategory_TapsAndHolds	= -63,
	RadarCategory_Jumps			= -49,
	RadarCategory_Holds			= -35,
	RadarCategory_Mines			= -21,
	RadarCategory_Hands			= -7,
	RadarCategory_Rolls			= 7,
}

local detailOffDelay = {
	RadarCategory_TapsAndHolds		= 0.1,
	RadarCategory_Jumps		= 0.15,
	RadarCategory_Holds		= 0.2,
	RadarCategory_Mines		= 0.25,
	RadarCategory_Hands		= 0.2,
	RadarCategory_Rolls	= 0.15,
}

local function DetailLabel(radarcat)
	local shortCat = ToEnumShortString(radarcat)
	return LoadFont(judgeFont)..{
		Name="Label"..shortCat;
		Text=string.upper(THEME:GetString("RadarCategory",shortCat));
		InitCommand=cmd(y,labelYOffset[radarcat];halign,1;shadowlength,1;);
		OffCommand=cmd(sleep,detailOffDelay[radarcat];linear,0.25;addx,SCREEN_WIDTH);
	};
end

local t = Def.ActorFrame{}
for k,v in pairs(labelYOffset) do
	table.insert(t,DetailLabel(k))
end

return t