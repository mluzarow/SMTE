return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,1");fadeleft,-2;cropleft,-2);
		OnCommand=cmd(linear,1;fadeleft,2;cropleft,2);
	};
};