return Def.ActorFrame{
	LoadActor(THEME:GetPathG("_bg","c"))..{
		InitCommand=cmd(zoomto,300,40;customtexturerect,0,0,300/self:GetWidth(),40/self:GetHeight();texcoordvelocity,0,-2);
	};
	Def.Quad{
		InitCommand=cmd(zoomto,300,40;diffuse,color("#880066CC"));
	};
	Def.Quad{
		Name="Border";
		InitCommand=cmd(zoomto,300,2;diffuse,color("#004400");valign,1;y,20);
	};
};