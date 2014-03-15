return Def.ActorFrame{	
	Def.Quad{
		InitCommand=cmd(x,THEME:GetMetric("ScreenSelectMusic","MusicWheelX");CenterY;zoomto,308,SCREEN_HEIGHT;diffuse,color("0,0,0,0.5"));
		OnCommand=cmd(addx,SCREEN_CENTER_X;decelerate,0.75;addx,-SCREEN_CENTER_X);
	};
};