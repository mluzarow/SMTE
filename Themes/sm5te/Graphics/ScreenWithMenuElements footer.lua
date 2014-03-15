local footerHeight = 64

return Def.ActorFrame{
	-- temp
	Def.Quad{
		InitCommand=cmd(zoomto,SCREEN_WIDTH,footerHeight;diffuse,color("#888888CC");valign,1;shadowlengthy,-4);
	};
	Def.Quad{
		InitCommand=cmd(zoomto,SCREEN_WIDTH,4;blend,Blend.Add;valign,0;y,-footerHeight;diffusealpha,0.25;diffusetopedge,color("1,1,1,0.075"));
	};
};