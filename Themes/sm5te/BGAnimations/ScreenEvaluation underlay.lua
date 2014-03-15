return Def.ActorFrame{
	Def.Quad{
		Name="BG";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+12;zoomto,SCREEN_CENTER_X*1.5,188;diffuse,color("0.05,0.05,0.05,0.45");fadeleft,0.125;faderight,0.125);
		OffCommand=cmd(decelerate,0.5;zoomx,0);
	};

	Def.ActorFrame{
		Name="TopSeparator";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-84;);
		OffCommand=cmd(decelerate,0.75;addy,-SCREEN_CENTER_Y);
		Def.Quad{
			InitCommand=cmd(blend,Blend.Add;diffusealpha,0.35;zoomto,SCREEN_CENTER_X*1.5,2;fadeleft,0.25;faderight,0.25);
		};
		Def.Quad{
			InitCommand=cmd(y,-1;blend,Blend.Add;diffusealpha,0.45;zoomto,SCREEN_CENTER_X*1.5,1;fadeleft,0.25;faderight,0.25);
		};
	};

	Def.ActorFrame{
		Name="BotSeparator";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+108;);
		OffCommand=cmd(decelerate,0.75;addy,SCREEN_CENTER_Y);
		Def.Quad{
			InitCommand=cmd(blend,Blend.Add;diffusealpha,0.35;zoomto,SCREEN_CENTER_X*1.5,2;fadeleft,0.25;faderight,0.25);
		};
		Def.Quad{
			InitCommand=cmd(y,-1;blend,Blend.Add;diffusealpha,0.45;zoomto,SCREEN_CENTER_X*1.5,1;fadeleft,0.25;faderight,0.25);
		};
	};

	Def.ActorFrame{
		Name="MidVertSeparator";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+12);
		Def.Quad{
			InitCommand=cmd(blend,Blend.Add;diffusealpha,0.35;zoomto,2,180;fadetop,0.1;fadebottom,0.1);
			OffCommand=cmd(decelerate,0.5;zoomy,0);
		};
	};
};