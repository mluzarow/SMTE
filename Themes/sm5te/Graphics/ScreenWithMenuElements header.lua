local headerHeight = 48

return Def.ActorFrame{
	-- temp
	Def.Quad{
		InitCommand=cmd(zoomto,SCREEN_WIDTH,headerHeight;diffuse,color("#888888CC");valign,0;shadowlengthy,4);
	};
	Def.Quad{
		InitCommand=cmd(zoomto,SCREEN_WIDTH,4;blend,Blend.Add;valign,1;y,headerHeight;diffusealpha,0.25;diffusebottomedge,color("1,1,1,0.075"));
	};
};