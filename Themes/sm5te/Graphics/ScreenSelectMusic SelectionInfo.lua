-- ScreenSelectMusic SelectionInfo
local offsetX = 132

return Def.ActorFrame{
	-- length
	LoadFont("_smallcaps 8px")..{
		InitCommand=cmd(x,-offsetX;halign,0;shadowlength,1);
		SetCommand=function(self)
			local songCourse = SongOrCourse()
			local timeVal = 0
			if songCourse then
				timeVal = songCourse:MusicLengthSeconds()
			end

			if SecondsToMSS(timeVal) == "1:45" then
				timeVal = songCourse:GetStepsSeconds()
			else
				self:settext( string.format(THEME:GetString("ScreenSelectMusic","Time %s"),SecondsToMSS(timeVal)) )
			end
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	};

	-- song bpm (doesn't handle per-chart stuff, though it can)
	LoadFont("_smallcaps 8px")..{
		InitCommand=cmd(x,offsetX;halign,1;shadowlength,1);
		SetCommand=function(self)
			local songCourse = SongOrCourse()
			local val
			if songCourse then
				local bpms = songCourse:GetDisplayBpms()

				if bpms[1] == bpms[2] then
					val = string.format("%i",bpms[1])
				else
					val = string.format("%i-%i",bpms[1],bpms[2])
				end
			else
				val = "000"
			end
			self:settext(val.." BPM")
		end;
		CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
		CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	};
};