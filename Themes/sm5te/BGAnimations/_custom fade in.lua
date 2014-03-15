local inTime = ...
assert(inTime,"_custom fade in requires inTime")

return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(FullScreen;diffuse,color("0,0,0,1")),
		OnCommand=cmd(linear,inTime;diffusealpha,0),
	},
}