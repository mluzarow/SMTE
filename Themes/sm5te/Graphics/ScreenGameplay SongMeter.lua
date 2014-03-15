return Def.ActorFrame{
	Def.SongMeterDisplay{
		StreamWidth=172; -- xxx: old way of doing it
		Stream=Def.Quad{
			InitCommand=cmd(zoomy,14;diffusecolor,color("#00FFCC");diffusealpha,0.75);
		};
		Tip=Def.Quad{
			InitCommand=cmd(x,1;halign,1;zoomto,2,14;diffusealpha,0.95;fadeleft,0.5);
			OnCommand=cmd(diffuseshift;effectclock,'beat';effectcolor1,color("1,1,1,1");effectcolor2,color("1,1,1,0.75"));
		};
	};
};