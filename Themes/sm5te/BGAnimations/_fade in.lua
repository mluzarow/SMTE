return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("0,0,0,1")),
		OnCommand=cmd(linear,1;diffusealpha,0),
	},
}