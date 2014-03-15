return Def.ActorFrame{
	LoadActor(THEME:GetPathG("_freemco","big"))..{
		InitCommand=cmd(Center;croptop,1;fadetop,1;),
		OnCommand=cmd(sleep,0.75;accelerate,0.5;croptop,0;fadetop,0);
	},
	LoadFont("_neogrey medium 24px")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+6;y,SCREEN_CENTER_Y+72;diffuse,color("0,0,0,1");cropright,1;faderight,1),
		BeginCommand=cmd(settext,"For the love of the game."),
		OnCommand=cmd(sleep,1.25;linear,0.5;cropright,0;faderight,0);
	},
}