-- todo: get this bitch to scroll
return Def.ActorFrame{
	LoadFont("_francophilsans Bold 24px")..{
		InitCommand=cmd(zoom,12/24;shadowlength,1;);
		BeginCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local npText

			if GAMESTATE:IsCourseMode() then
				npText = "wankers"
			else
				local song = SongOrCourse()
				if song then
					npText = string.format("%s - %s",
						song:GetDisplayArtist(),song:GetDisplayFullTitle())
				else
					npText = "wtf mate"
				end
			end

			self:settext(npText)
		end;
	};
};