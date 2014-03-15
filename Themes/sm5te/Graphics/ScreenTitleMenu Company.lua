return Def.ActorFrame{
	LoadActor(THEME:GetPathG("_freemco","small"))..{
		Name="Company",
		InitCommand=cmd(y,-10;shadowlengthy,1.5;shadowcolor,color("#263B40CC")),
	},
	LoadFont("_smallcaps 8px")..{
		Name="Website",
		InitCommand=cmd(y,12;shadowlength,2;shadowcolor,color("#263B40");diffusebottomedge,color("#929C9F");diffusetopedge,color("#F2FCFF"););
		BeginCommand=cmd(settext,THEME:GetString("ScreenTitleMenu","freemcoWeb")),
	},
}