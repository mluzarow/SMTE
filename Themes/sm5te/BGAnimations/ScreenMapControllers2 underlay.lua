-- new! MapControllers2 underlay
local t = Def.ActorFrame{
	Def.ActorFrame{
		Name="TopSection";
		Def.Quad{
			InitCommand=cmd(CenterX;y,SCREEN_TOP;valign,0;zoomto,SCREEN_WIDTH,56;diffuse,color("#22222288"));
		};
	};

	

	Def.ActorFrame{
		Name="BottomSection";
		Def.Quad{
			InitCommand=cmd(CenterX;y,SCREEN_BOTTOM;valign,1;zoomto,SCREEN_WIDTH,56;diffuse,color("#22222288"));
		};
	};
};

return t;