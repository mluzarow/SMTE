local t = Def.ActorFrame{
	Def.Quad{
		Name="Fallback";
		InitCommand=cmd(Center;FullScreen;diffuse,color("0,0,0,1"));
	};
}

if GAMESTATE:IsCourseMode() then
	-- decide if we have a course background, and if not (...? not sure yet)
else
	t[#t+1] = Def.Sprite {
		InitCommand=cmd(Center);
		BeginCommand=cmd(LoadFromCurrentSongBackground);
		OnCommand=cmd(scale_or_crop_background);
	};
end

return t