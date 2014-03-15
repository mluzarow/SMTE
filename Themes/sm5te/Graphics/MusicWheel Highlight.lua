return Def.ActorFrame{
	Def.ActorFrame{
		Name="Triangle";
		InitCommand=cmd(x,-166);

		LoadActor(THEME:GetPathG("_triangle","base"))..{
			Name="InnerBase";
			InitCommand=cmd(x,2;diffusealpha,0.25;zoom,0.625);
			OnCommand=cmd(diffuseshift;effectcolor1,color("1,1,1,0.25");effectcolor2,color("1,1,1,0.75");effectclock,'beat';);
		};
		LoadActor(THEME:GetPathG("_triangle","glow"))..{
			Name="InnerGlow";
			InitCommand=cmd(x,2;diffusealpha,0.25;zoom,0.625;blend,Blend.Add);
			OnCommand=cmd(diffuseshift;effectcolor1,color("1,1,1,0.25");effectcolor2,color("1,1,1,0.75");effectclock,'beat';);
		};

		LoadActor(THEME:GetPathG("_triangle","base"))..{
			Name="Base";
			InitCommand=cmd(diffusealpha,0.8;blend,Blend.Multiply);
		};
		LoadActor(THEME:GetPathG("_triangle","glow"))..{
			Name="Glow";
			InitCommand=cmd(blend,Blend.Add);
			OnCommand=cmd(diffuseshift;effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,0.15");effectperiod,0.75);
		};
	};
};