-- todo: make this display properly if the song options are not used

return Def.ActorFrame{
	BeginCommand=function(self)
		local c = self:GetChildren()
		local songCourse = SongOrCourse()

		if GAMESTATE:IsCourseMode() then
			c.Line1:settext("??")
			c.Line2:settext( ToEnumShortString(songCourse:GetCourseType()) )
			c.Line3:settext( songCourse:GetDisplayFullTitle() )
			c.Line4:settext("0 dongs")
			c.Line5:settext("") -- unused in course mode
		else
			c.Line1:settext( songCourse:GetGroupName() )
			c.Line2:settext( songCourse:GetGenre() )
			c.Line3:settext( songCourse:GetDisplayFullTitle() )
			c.Line4:settext( songCourse:GetDisplayArtist() )
			c.Line5:settext( GAMESTATE:GetSongOptionsString() )
		end
	end;

	LoadFont("_francophilsans normal 24px")..{
		Name="Line1";
		InitCommand=cmd(halign,0;y,-40;shadowlength,1;zoom,16/24;skewx,-0.1);
		OnCommand=cmd(addx,SCREEN_WIDTH;linear,0.5;addx,-SCREEN_WIDTH);
		OffCommand=cmd(linear,0.5;addx,SCREEN_WIDTH);
	};

	-- genre/course type
	LoadFont("_francophilsans normal 24px")..{
		Name="Line2";
		InitCommand=cmd(halign,0;y,-22;shadowlength,1;zoom,18/24);
		OnCommand=cmd(addx,SCREEN_WIDTH;sleep,0.1;linear,0.5;addx,-SCREEN_WIDTH);
		OffCommand=cmd(sleep,0.1;linear,0.5;addx,SCREEN_WIDTH);
	};

	-- song/course title
	LoadFont("_francophilsans Bold 24px")..{
		Name="Line3";
		InitCommand=cmd(halign,0;y,1;shadowlength,1;zoom,22/24);
		OnCommand=cmd(addx,SCREEN_WIDTH;sleep,0.2;linear,0.5;addx,-SCREEN_WIDTH);
		OffCommand=cmd(sleep,0.2;linear,0.5;addx,SCREEN_WIDTH);
	};

	-- artist/num songs
	LoadFont("_francophilsans normal 24px")..{
		Name="Line4";
		InitCommand=cmd(halign,0;y,24;shadowlength,1;zoom,18/24);
		OnCommand=cmd(addx,SCREEN_WIDTH;sleep,0.3;linear,0.5;addx,-SCREEN_WIDTH);
		OffCommand=cmd(sleep,0.3;linear,0.5;addx,SCREEN_WIDTH);
	};

	-- song options (non-course mode)
	LoadFont("_smallcaps 8px")..{
		Name="Line5";
		InitCommand=cmd(halign,0;y,44;shadowlength,1;);
		OnCommand=cmd(addx,SCREEN_WIDTH;sleep,0.4;linear,0.5;addx,-SCREEN_WIDTH);
		OffCommand=cmd(sleep,0.4;linear,0.5;addx,SCREEN_WIDTH);
	};
};