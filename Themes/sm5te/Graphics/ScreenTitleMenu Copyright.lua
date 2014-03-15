return Def.ActorFrame{
	LoadFont("_smallcaps 8px")..{
		BeginCommand=cmd(shadowlength,2;uppercase,true;settext,THEME:GetString("ScreenTitleMenu","Copyright");),
	},
}