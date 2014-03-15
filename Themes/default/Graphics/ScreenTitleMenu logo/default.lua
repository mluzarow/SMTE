local t = Def.ActorFrame{
	InitCommand=cmd(fov,70);
	LoadActor("_arrow")..{
		InitCommand=cmd(x,225;);
		OnCommand=cmd(pulse;effectperiod,1.5;effectmagnitude,1,1.1,0;effecttiming,0.25,0.125,0.5,0.125;);
	};
	LoadActor("_text");
	LoadActor("_text")..{
		Name="TextGlow";
		InitCommand=cmd(blend,Blend.Add;diffusealpha,0.05;);
		OnCommand=cmd(glowshift;effectperiod,2.5;effectcolor1,color("1,1,1,0.25");effectcolor2,color("1,1,1,1"););
	};
};

return t;