return Def.ActorFrame{
	LoadActor(THEME:GetPathG("_roulette","felt"));
	Def.Quad{
		Name="Border";
		InitCommand=cmd(zoomto,300,2;diffuse,color("#004400");valign,1;y,20);
	};

	Def.Quad{
		Name="LeftSep";
		InitCommand=cmd(x,-108;zoomto,2,40;diffuse,color("#FFFFFFAA");fadetop,1/3;fadebottom,1/3);
	};
	LoadActor(THEME:GetPathG("_roulette","icon"))..{
		InitCommand=cmd(x,-130;y,-2;);
	};
};