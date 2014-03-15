return Def.ActorFrame{
	LoadActor(THEME:GetPathB("ScreenOptions","underlay"));

	-- per player shite
	Def.ActorFrame{
		Name="ExplainP1";
		InitCommand=cmd(x,SCREEN_CENTER_X-156;y,SCREEN_CENTER_Y+140;player,PLAYER_1);
		LoadActor(THEME:GetPathG("_options","explanationframe"))..{
			InitCommand=cmd(diffuse,PlayerColor(PLAYER_1));
		};
	};
	Def.ActorFrame{
		Name="ExplainP2";
		InitCommand=cmd(x,SCREEN_CENTER_X+156;y,SCREEN_CENTER_Y+140;player,PLAYER_2);
		LoadActor(THEME:GetPathG("_options","explanationframe"))..{
			InitCommand=cmd(diffuse,PlayerColor(PLAYER_2));
		};
	};
};