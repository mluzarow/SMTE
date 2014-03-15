return Def.ActorFrame{
	Def.Quad{
		Name="BG";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+4;zoomto,SCREEN_CENTER_X+256,SCREEN_HEIGHT-(112);diffuse,color("0.15,0.15,0.15,0.8"));
	};
	Def.Quad{
		Name="TopBar";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-172;zoomto,SCREEN_CENTER_X+224,2;fadeleft,0.25;faderight,0.25;diffusealpha,0.35;blend,Blend.Add);
	};
	Def.Quad{
		Name="BotBar";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+180;zoomto,SCREEN_CENTER_X+224,2;fadeleft,0.25;faderight,0.25;diffusealpha,0.35;blend,Blend.Add);
	};
};