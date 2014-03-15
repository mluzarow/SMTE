-- ScreenSelectMusic SongOptions
return Def.ActorFrame{
	LoadFont("_smallcaps 8px")..{
		InitCommand=cmd(x,-130;halign,0;shadowlength,1);
		BeginCommand=cmd(playcommand,"Set");
		SongOptionsChangedMessageCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			self:settext(GAMESTATE:GetSongOptionsString())
		end;
	};
};