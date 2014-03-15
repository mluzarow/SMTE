local judgeFont = "_smallcaps 8px"
local labelZoom = 1.0

local labelYOffset = {
	TapNoteScore_W1 = -40,
	TapNoteScore_W2 = -30,
	TapNoteScore_W3 = -20,
	TapNoteScore_W4 = -10,
	TapNoteScore_W5 = 0,
	TapNoteScore_Miss = 10,
}

local tnsOffDelay = {
	TapNoteScore_W1		= 0.1,
	TapNoteScore_W2		= 0.15,
	TapNoteScore_W3		= 0.2,
	TapNoteScore_W4		= 0.25,
	TapNoteScore_W5		= 0.2,
	TapNoteScore_Miss	= 0.15,
}

-- todo: player-specific stuff
local function JudgeLabel(pn,tns)
	local tn = ToEnumShortString(tns)
	local flip = pn == PLAYER_1 and -1 or 1
	local textAlign = pn == PLAYER_1 and 1 or 0
	local xPos = pn == PLAYER_1 and -124 or 18
	return LoadFont(judgeFont)..{
		Name="Label"..pname(pn)..tn;
		Text=THEME:GetString("TapNoteScore",tn);
		InitCommand=cmd(x,xPos;y,labelYOffset[tns];halign,textAlign;shadowlength,1;zoom,labelZoom;diffuse,JudgeColors[tn]);
		BeginCommand=function(self)
			if tns == "TapNoteScore_W1" then
				self:diffuse( color("#ffff30") )
				self:diffusetopedge( color("#FFFFFF") )
				self:diffusebottomedge( color("#ffaf00") )
			end
		end;
		OffCommand=cmd(sleep,tnsOffDelay[tns];linear,0.25;addx,SCREEN_WIDTH*flip);
	};
end

local t = Def.ActorFrame{}

for pn in ivalues(PlayerNumber) do
	for k,v in pairs(labelYOffset) do
		table.insert(t,JudgeLabel(pn,k))
	end
	-- todo: add max combo to the festivities
end

return t
