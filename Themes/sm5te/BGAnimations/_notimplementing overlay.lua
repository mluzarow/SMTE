local reflecYDiff = 31

return Def.ActorFrame{
	Def.ActorFrame{
		Name="ConstructionTape";
		InitCommand=cmd(CenterX);
		Def.ActorFrame{
			Name="Top";
			InitCommand=cmd(y,SCREEN_CENTER_Y-144;);
			Def.Quad{
				InitCommand=cmd(zoomto,SCREEN_WIDTH,32;diffuse,color("0.05,0.05,0.05,0.625"));
			};
			LoadActor(THEME:GetPathG("","_cautiontape"))..{
				Name="Tape";
				InitCommand=cmd(zoomto,SCREEN_WIDTH,32;customtexturerect,0,0,SCREEN_WIDTH/self:GetWidth(),1;texcoordvelocity,1/8,0;fadetop,1/5;fadebottom,1/3);
			};
		};
		Def.ActorFrame{
			Name="Bottom";
			InitCommand=cmd(y,SCREEN_CENTER_Y+144;);
			Def.Quad{
				InitCommand=cmd(zoomto,SCREEN_WIDTH,32;diffuse,color("0.05,0.05,0.05,0.625"));
			};
			LoadActor(THEME:GetPathG("","_cautiontape"))..{
				Name="Tape";
				InitCommand=cmd(zoomto,SCREEN_WIDTH,32;customtexturerect,0,0,SCREEN_WIDTH/self:GetWidth(),1;texcoordvelocity,-1/8,0;fadetop,1/5;fadebottom,1/3);
			};
		};
	};

	LoadActor(THEME:GetPathG("_warning","sign"))..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-45);
	};
	Def.ActorFrame{
		InitCommand=cmd(fov,70);
		LoadActor(THEME:GetPathG("_warning","sign"))..{
			InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-(45-reflecYDiff);zoomy,-1;rotationx,86;fadetop,1.25);
		};
	};

	LoadFont("_francophilsans normal 24px")..{
		Name="Warning";
		Text=THEME:GetString("_notimplementing","Warning");
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+20;shadowlength,2;maxwidth,SCREEN_CENTER_X+300);
	};
};