local outTime = ...
assert(outTime,"_custom fade out requires outTime")

return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("0,0,0,0")),
		OnCommand=cmd(linear,outTime;diffusealpha,1),
	},
}