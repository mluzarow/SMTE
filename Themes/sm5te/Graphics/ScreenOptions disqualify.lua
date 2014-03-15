return LoadFont("_francophilsans Bold 24px")..{
	InitCommand=cmd(shadowlength,1;settext,ScreenString("Disqualify");zoom,16/24);
	BeginCommand=cmd(diffuseblink;effectcolor1,color("1,0,0,1");effectcolor2,color("1,1,1,1");effectperiod,1/3);
};