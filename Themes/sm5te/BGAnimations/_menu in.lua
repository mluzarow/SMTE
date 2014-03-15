return Def.ActorFrame{
	Def.Quad{
		Name="Top";
		InitCommand=cmd(CenterX;y,SCREEN_TOP;valign,0;diffuse,color("0,0,0,1");zoomto,SCREEN_WIDTH,SCREEN_CENTER_Y);
		OnCommand=cmd(accelerate,0.5;zoomy,0);
	};
	Def.Quad{
		Name="Bottom";
		InitCommand=cmd(CenterX;y,SCREEN_BOTTOM;valign,1;diffuse,color("0,0,0,1");zoomto,SCREEN_WIDTH,SCREEN_CENTER_Y);
		OnCommand=cmd(accelerate,0.5;zoomy,0);
	};
};