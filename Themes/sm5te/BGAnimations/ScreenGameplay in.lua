local t = Def.ActorFrame {
	Def.Sprite {
		InitCommand=cmd(Center;diffusealpha,1;);
		BeginCommand=cmd(LoadFromCurrentSongBackground);
		OnCommand=cmd(scale_or_crop_background;linear,0.15;diffusealpha,0;);
	};
};
return t;