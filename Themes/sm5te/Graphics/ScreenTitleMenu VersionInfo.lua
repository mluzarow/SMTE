return Def.ActorFrame{
	LoadFont("_smallcaps 8px")..{
		Name="ProgVer",
		InitCommand=cmd(shadowlength,1;),
		BeginCommand=function(self)
			if not VersionDate then
				self:settext( string.format("P:%s",ProductVersion()) )
			else
				self:settext( string.format("P:%s (%s)",ProductVersion(),VersionDate()) )
			end
		end,
	},
	LoadFont("_smallcaps 8px")..{
		Name="ThemeVer",
		InitCommand=cmd(shadowlength,1;y,12;),
		BeginCommand=function(self)
			self:settext( string.format("T:%s (%s)",themeInfo.Version,themeInfo.Date) )
		end,
	},
};