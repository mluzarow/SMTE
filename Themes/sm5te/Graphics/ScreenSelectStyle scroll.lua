local gc = Var("GameCommand")
local name = gc:GetName()
local game = GAMESTATE:GetCurrentGame():GetName()
local itemname = game.."-"..name

local focusColor   = color("1,1,1,1")
local unfocusColor = color("0.6,0.6,0.6,1")

local gameBaseOverlay = {
	dance = {
		Single	= { Base="panel single", Overlay="dance-4p" },
		Double	= { Base="panel double", Overlay="dance-8p" },
		Solo	= { Base="panel single", Overlay="dance-6p" },
		Versus	= { Base="panel double", Overlay="dance-8p" },
		Couple	= { Base="panel double", Overlay="dance-8p" },
	},
	pump = {
		Single		= { Base="pump single", Overlay="pump-5p" },
		Double		= { Base="pump double", Overlay="pump-10p" },
		HalfDouble	= { Base="pump double", Overlay="pump-6p" },
		Versus		= { Base="pump double", Overlay="pump-10p" },
		Couple		= { Base="pump double", Overlay="pump-10p" },
		Routine		= { Base="pump double", Overlay="pump-10p" },
	},
	techno = {
		-- todo
	},
	beat = {
		["5Keys"]	= { Base="beat single", Overlay="beat5" },
		["7Keys"]	= { Base="beat single", Overlay="unknown-p" },
		["10Keys"]	= { Base="beat double", Overlay="unknown-p" },
		["14Keys"]	= { Base="beat double", Overlay="unknown-p" },
		Versus5		= { Base="beat double", Overlay="unknown-p" },
		Versus7		= { Base="beat double", Overlay="unknown-p" },
	},
	popn = {
		-- todo
	},
	para = {
		Single	= { Base="para", Overlay="para-5r" }
	},
	maniax = {
		-- todo
	},
	kb7 = {
		-- only one style
		kb7	= { Base="kb7", Overlay="kb7" }
	},
	-- ez2?
}

local function GetBase() return gameBaseOverlay[game][name].Base end
local function GetOverlay() return gameBaseOverlay[game][name].Overlay end

return Def.ActorFrame{
	Def.ActorFrame{
		Name="Base";
		LoadActor(THEME:GetPathG("_style","base"))..{
			InitCommand=cmd();
			GainFocusCommand=cmd(diffuse,focusColor);
			LoseFocusCommand=cmd(diffuse,unfocusColor);
			OffFocusedCommand=cmd(sleep,0.5;linear,0.25;addy,-SCREEN_HEIGHT);
			OffUnfocusedCommand=cmd(linear,0.2;zoomy,0);
		};

		LoadFont("_francophilsans Bold 24px")..{
			Text=THEME:GetString(Var "LoadingScreen",itemname.."Main");
			InitCommand=cmd(x,64;y,-24;);
			GainFocusCommand=cmd(diffuse,focusColor);
			LoseFocusCommand=cmd(diffuse,unfocusColor);
			OffFocusedCommand=cmd(sleep,0.5;linear,0.25;addy,-SCREEN_HEIGHT);
			OffUnfocusedCommand=cmd(linear,0.2;zoomy,0);
		};
		LoadFont("_francophilsans Bold 24px")..{
			Text=THEME:GetString(Var "LoadingScreen",itemname.."Secondary");
			InitCommand=cmd(x,62;y,10;valign,0;zoom,14/24;wrapwidthpixels,280);
			GainFocusCommand=cmd(diffuse,focusColor);
			LoseFocusCommand=cmd(diffuse,unfocusColor);
			OffFocusedCommand=cmd(sleep,0.5;linear,0.25;addy,-SCREEN_HEIGHT);
			OffUnfocusedCommand=cmd(linear,0.2;zoomy,0);
		};

		Def.ActorFrame{
			Name="StylePreview";
			InitCommand=cmd(x,-64;);

			LoadActor( THEME:GetPathG("_style","icons/_base "..GetBase()) )..{
				Name="Base";
				InitCommand=cmd();
				GainFocusCommand=cmd(diffuse,focusColor);
				LoseFocusCommand=cmd(diffuse,unfocusColor);
				OffFocusedCommand=cmd(sleep,0.5;linear,0.25;addy,-SCREEN_HEIGHT);
				OffUnfocusedCommand=cmd(linear,0.2;zoomy,0);
			};
			LoadActor( THEME:GetPathG("_style","icons/"..GetOverlay()) )..{
				Name="Overlay";
				GainFocusCommand=cmd(diffuse,focusColor);
				LoseFocusCommand=cmd(diffuse,unfocusColor);
				OffFocusedCommand=cmd(sleep,0.5;linear,0.25;addy,-SCREEN_HEIGHT);
				OffUnfocusedCommand=cmd(linear,0.2;zoomy,0);
			};
		};
	};
};