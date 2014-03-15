local judgeFont = "_dejavu sans Bold 24px"
local labelZoom = 14/24

local labelYOffset = {
	TapNoteScore_W1 = -40,
	TapNoteScore_W2 = -20,
	TapNoteScore_W3 = 0,
	TapNoteScore_W4 = 20,
	TapNoteScore_W5 = 40,
	TapNoteScore_Miss = 60,
}

local function JudgeLabel(tns)
	local tn = ToEnumShortString(tns)
	return LoadFont(judgeFont)..{
		Name="Label"..tn;
		Text=THEME:GetString("TapNoteScore",tn);
		InitCommand=cmd(y,labelYOffset[tns];halign,1;shadowlength,1;zoom,labelZoom;diffuse,JudgeColors[tn]);
		BeginCommand=function(self)
			if tns == "TapNoteScore_W1" then
				self:diffuse( color("#ffff30") )
				self:diffusetopedge( color("#FFFFFF") )
				self:diffusebottomedge( color("#ffaf00") )
			end
		end;
	};
end

local tnsToFrame = {
	TapNoteScore_W1		= 0,
	TapNoteScore_W2		= 1,
	TapNoteScore_W3		= 2,
	TapNoteScore_W4		= 3,
	TapNoteScore_W5		= 4,
	TapNoteScore_Miss	= 5,
}

local tnsOffDelay = {
	TapNoteScore_W1		= 0.1,
	TapNoteScore_W2		= 0.15,
	TapNoteScore_W3		= 0.2,
	TapNoteScore_W4		= 0.25,
	TapNoteScore_W5		= 0.2,
	TapNoteScore_Miss	= 0.15,
}

local function JudgeGraphic(tns)
	local tn = ToEnumShortString(tns)
	local jg = Def.ActorFrame{
		LoadActor(THEME:GetPathG("Judgment","Eval 1P"))..{
			Name="Label"..tn;
			InitCommand=cmd(y,labelYOffset[tns];halign,1;zoom,labelZoom;pause;setstate,tnsToFrame[tns]);
			OffCommand=cmd(sleep,tnsOffDelay[tns];linear,0.25;addx,-SCREEN_WIDTH);
		};
	}
	-- todo: add judge seconds if not TNS_Miss
	return jg
end

local t = Def.ActorFrame{}
for k,v in pairs(labelYOffset) do
	table.insert(t,JudgeGraphic(k))
end

t[#t+1] = LoadActor(THEME:GetPathG("_eval","maxcombo"))..{
	InitCommand=cmd(y,labelYOffset["TapNoteScore_Miss"]+20;halign,1;zoom,labelZoom;);
	OffCommand=cmd(sleep,0.1;linear,0.25;addx,-SCREEN_WIDTH);
};

return t
