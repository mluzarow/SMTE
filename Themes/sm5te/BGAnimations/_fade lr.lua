return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,1");faderight,2;cropright,2);
		OnCommand=cmd(linear,1;faderight,-2;cropright,-2);
	};
};