local gc = Var("GameCommand")
local itemname = gc:GetName()
local is2P = itemname == "2P"

local player = (itemname == "2P") and PLAYER_2 or PLAYER_1

local flip = is2P and -1 or 1
local mainHAlign = is2P and 1 or 0
local secondHAlign = is2P and 0 or 1

local secondX = is2P and -120 or 120

local panelAnimTime = 0.15

local focusColor   = color("1,1,1,1")
local unfocusColor = color("0.6,0.6,0.6,1")

local OnePDisplay = Def.ActorFrame{
	LoadActor(THEME:GetPathG("_player","icon"))..{
		GainFocusCommand=cmd(diffuse,color("#FFFFFF"));
		LoseFocusCommand=cmd(diffuse,color("#888888"));
	};
};

local TwoPDisplay = Def.ActorFrame{
	LoadActor(THEME:GetPathG("_player","icon"))..{
		Name="Left";
		InitCommand=cmd(x,-24);
		GainFocusCommand=cmd(diffuse,color("#FFFFFF"));
		LoseFocusCommand=cmd(diffuse,color("#888888"));
	};
	LoadActor(THEME:GetPathG("_player","icon"))..{
		Name="Right";
		InitCommand=cmd(x,24);
		GainFocusCommand=cmd(diffuse,color("#FFFFFF"));
		LoseFocusCommand=cmd(diffuse,color("#888888"));
	};
};

local item = Def.ActorFrame{
	OffFocusedCommand=function(self)
		if itemname == "1P" and GAMESTATE:GetNumSidesJoined() > 1 then
			-- unjoin the non-master player
			GAMESTATE:UnjoinPlayer(OppositePlayer(GAMESTATE:GetMasterPlayerNumber()))
		end
	end;
};

-- depending on 1p/2p
local playerItem = is2P and TwoPDisplay or OnePDisplay
local base = Def.ActorFrame{
	Name="Base";
	LoadActor(THEME:GetPathG("_numplayer","base"))..{
		InitCommand=cmd(zoomx,flip);
		GainFocusCommand=cmd(diffuse,focusColor);
		LoseFocusCommand=cmd(diffuse,unfocusColor);
		OffFocusedCommand=cmd(decelerate,0.25;addy,-64;sleep,0.2;linear,0.25;addx,SCREEN_CENTER_X*(-flip));
		OffUnfocusedCommand=cmd(linear,0.25;addx,SCREEN_CENTER_X*(-flip));
	};
	LoadFont("_francophilsans Bold 24px")..{
		Text=THEME:GetString(Var "LoadingScreen",itemname.."Main");
		InitCommand=cmd(y,-13;halign,mainHAlign);
		GainFocusCommand=cmd(diffuse,focusColor);
		LoseFocusCommand=cmd(diffuse,unfocusColor);
		OffFocusedCommand=cmd(decelerate,0.25;addy,-64;sleep,0.2;linear,0.25;addx,SCREEN_CENTER_X*(-flip));
		OffUnfocusedCommand=cmd(linear,0.25;addx,SCREEN_CENTER_X*(-flip));
	};
	LoadFont("_smallcaps 8px")..{
		Text=THEME:GetString(Var "LoadingScreen",itemname.."Secondary");
		InitCommand=cmd(x,secondX;y,5;halign,secondHAlign;shadowlength,1);
		GainFocusCommand=cmd(diffuse,focusColor);
		LoseFocusCommand=cmd(diffuse,unfocusColor);
		OffFocusedCommand=cmd(decelerate,0.25;addy,-64;sleep,0.2;linear,0.25;addx,SCREEN_CENTER_X*(-flip));
		OffUnfocusedCommand=cmd(linear,0.25;addx,SCREEN_CENTER_X*(-flip));
	};
};

base[#base+1] = playerItem..{
	InitCommand=cmd(x,-64*flip;);
	OffFocusedCommand=cmd(decelerate,0.25;addy,-64;sleep,0.2;linear,0.25;addx,SCREEN_CENTER_X*(-flip));
	OffUnfocusedCommand=cmd(linear,0.25;addx,SCREEN_CENTER_X*(-flip));
};

item[#item+1] = base

return item