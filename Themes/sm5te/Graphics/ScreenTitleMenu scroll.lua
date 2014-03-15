local gc = Var("GameCommand")
local itemName = gc:GetName()
local itemColor = titleMenuItems[itemName]

local iconCommands = {
	GameStart = {
		Gain = (cmd(bounce;effectmagnitude,4,0,0;effectperiod,1;effecttiming,0.2,0.075,0.5,0.3)),
		Lose = (cmd(stopeffect)),
	},
	GameType = {
		Gain = (cmd(spin;effectmagnitude,0,192,0;effectperiod,0.75)),
		Lose = (cmd(stopeffect;rotationy,0)),
	},
	Data = {
		Gain = (cmd(wag;effectmagnitude,0,35,20;effectperiod,2)),
		Lose = (cmd(stopeffect;rotationz,0)),
	},
	Options = {
		Gain = (cmd(bob;effectmagnitude,0,2,0;effecttiming,0.25,0.1,0.2,0.1;effectperiod,1;)),
		Lose = (cmd(stopeffect)),
	},
	Exit = {
		Gain = (cmd(pulse;effectmagnitude,1.25,1,1;effectperiod,0.75)),
		Lose = (cmd(stopeffect;zoom,1)),
	},

	Jukebox = {
		Gain = (cmd(wag;effectmagnitude,0,35,20;effectperiod,2)),
		Lose = (cmd(stopeffect;rotationz,0)),
	},
}

return Def.ActorFrame{
	InitCommand=cmd(fov,40);
	Def.Quad{
		Name="BG";
		InitCommand=cmd(x,-48;halign,0;zoomto,224,24;diffuse,color("0,0,0,0.25");fadeleft,0.25;faderight,0.25);
		GainFocusCommand=cmd(linear,0.25;diffusecolor,BoostColor(itemColor,0.325);diffusealpha,0.5);
		LoseFocusCommand=cmd(stoptweening;decelerate,0.25;diffuse,color("0,0,0,0.25"));
	};
	Def.Quad{
		InitCommand=cmd(x,-48;y,14;halign,0;zoomto,212,2;diffuse,color("0.2,0.2,0.2,0.5");fadeleft,0.25;faderight,0.25);
		BeginCommand=cmd(visible,itemName ~= "Exit");
	};
	LoadActor("_title icons")..{
		Name="IconLeft";
		InitCommand=cmd(x,-20;pause;setstate,gc:GetIndex(););
		BeginCommand=function(self)
			self:addcommand("CheckGain",iconCommands[itemName].Gain)
			self:addcommand("CheckLose",iconCommands[itemName].Lose)
		end,
		GainFocusCommand=cmd(playcommand,"CheckGain";visible,true;);
		LoseFocusCommand=cmd(playcommand,"CheckLose";visible,false;);
	};
	LoadFont("_francophilsans Bold 24px")..{
		InitCommand=cmd(x,64;shadowlength,1;uppercase,true;NoStroke;shadowcolor,color("0.1,0.1,0.1,0.75");),
		BeginCommand=cmd(settext,THEME:GetString("ScreenTitleMenu",gc:GetText())),
		EnabledCommand=cmd(diffuse,color("1,1,1,0.5");diffusebottomedge,color("0.75,0.75,0.75,0.5"););
		DisabledCommand=cmd(diffuse,color("0.5,0.5,0.5,0.5");diffusebottomedge,color("0.375,0.375,0.375,0.5"););
		GainFocusCommand=cmd(stoptweening;linear,0.125;zoom,18/24;diffuse,itemColor;diffusebottomedge,ColorMidTone(itemColor);),
		LoseFocusCommand=cmd(stoptweening;linear,0.125;zoom,14/24;diffuse,color("1,1,1,0.5");diffusebottomedge,color("0.75,0.75,0.75,0.5");),
	};
	LoadActor("_title icons")..{
		Name="IconRight";
		InitCommand=cmd(x,148;zoomx,-1;pause;setstate,gc:GetIndex(););
		BeginCommand=function(self)
			-- hack for GameStart to act the correct way
			if itemName == "GameStart" then
				self:addcommand("CheckGain",(cmd(bounce;effectmagnitude,-4,0,0;effectperiod,1;effecttiming,0.2,0.075,0.5,0.3)))
			-- hack for Data as well
			elseif itemName == "Data" then
				self:addcommand("CheckGain",(cmd(wag;effectmagnitude,0,35,-20;effectperiod,2)))
			else
				self:addcommand("CheckGain",iconCommands[itemName].Gain)
			end
			self:addcommand("CheckLose",iconCommands[itemName].Lose)
		end,
		GainFocusCommand=cmd(playcommand,"CheckGain";visible,true;);
		LoseFocusCommand=cmd(playcommand,"CheckLose";visible,false;);
	};
};