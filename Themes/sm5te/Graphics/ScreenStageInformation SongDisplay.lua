return Def.ActorFrame{
	BeginCommand=function(self)
		local c = self:GetChildren()
		local timeVal = 0
		local songCourse = SongOrCourse()

		if songCourse then
			c.Group:settext( songCourse:GetGroupName() )
			c.Genre:settext( songCourse:GetGenre() )
			c.Title:settext( songCourse:GetDisplayFullTitle() )
			c.Artist:settext( songCourse:GetDisplayArtist() )

			-- xxx: fucking r21 shitdongers
			timeVal = songCourse:MusicLengthSeconds()
			if SecondsToMSS(timeVal) == "1:45" then
				timeVal = songCourse:GetStepsSeconds()
			end
			c.Length:settext( SecondsToMSS(timeVal) )
		end
	end;

	Def.Quad{
		InitCommand=cmd(zoomto,SCREEN_WIDTH,0;diffuse,color("0.1,0.1,0.1,0.8"));
		OnCommand=cmd(accelerate,0.25;zoomy,128);
		OffCommand=cmd(sleep,1;decelerate,0.2;zoomy,0);
	};

	LoadFont("_francophilsans normal 24px")..{
		Name="Group";
		InitCommand=cmd(y,-48;zoom,16/24;shadowlength,1);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
	LoadFont("_francophilsans normal 24px")..{
		Name="Genre";
		InitCommand=cmd(y,-24;zoom,20/24;shadowlength,1);
		OffCommand=cmd(sleep,0.25;linear,0.5;diffusealpha,0);
	};
	LoadFont("_francophilsans normal 24px")..{
		Name="Title";
		InitCommand=cmd(shadowlength,1);
		OffCommand=cmd(sleep,0.5;linear,0.5;diffusealpha,0);
	};
	LoadFont("_francophilsans normal 24px")..{
		Name="Artist";
		InitCommand=cmd(y,24;zoom,20/24;shadowlength,1);
		OffCommand=cmd(sleep,0.25;linear,0.5;diffusealpha,0);
	};
	LoadFont("_francophilsans normal 24px")..{
		Name="Length";
		InitCommand=cmd(y,48;zoom,16/24;shadowlength,1);
		OffCommand=cmd(linear,0.5;diffusealpha,0);
	};
};