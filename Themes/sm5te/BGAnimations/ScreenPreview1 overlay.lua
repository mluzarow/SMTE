return Def.ActorFrame{
	LoadFont("_dejavu sans Bold 24px")..{
		Name="Header";
		Text="Notice";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-128;shadowlength,2);
	};
	LoadFont("_dejavu sans Bold 24px")..{
		Name="Notice";
		Text="This software is a work in progress.\nIt is being released to gauge reactions and solicit feedback.\nEverything contained in this release is subject to change.\nThere is no warranty with this software.\nThis software is free of charge.\nif you have paid for it, you've been scammed.\nGet your money back.\nPlease report issues and bugs at wherever you obtained this game.";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y;shadowlength,1;zoom,16/24;wrapwidthpixels,(SCREEN_CENTER_X+300)*(24/16));
	};

	LoadFont("_dejavu sans Bold 24px")..{
		Name="Title";
		Text="StepMania 5 Tournament Edition";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+164;valign,1;shadowlength,2;zoom,16/24);
	};
	LoadFont("_dejavu sans Bold 24px")..{
		Name="Copyright";
		Text="Copyright ©2012 freemco";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+180;valign,1;shadowlength,2;zoom,14/24);
	};
};