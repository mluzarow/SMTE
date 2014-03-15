-- todo: show some stuff like cleared or whatever... idfk
return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("0,0,0,0")),
		OnCommand=cmd(sleep,1;linear,1;diffusealpha,1),
	},
};