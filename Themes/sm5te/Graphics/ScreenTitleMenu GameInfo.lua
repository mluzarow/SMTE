return Def.ActorFrame{
	LoadFont("_smallcaps 8px")..{
		Name="Gametype",
		InitCommand=cmd(shadowlength,1;halign,1),
		BeginCommand=function(self)
			local str = ScreenString("Gametype: %s")
			self:settext( string.format(str,GAMESTATE:GetCurrentGame():GetName()) )
		end,
	},
	LoadFont("_smallcaps 8px")..{
		Name="JudgeDiff",
		InitCommand=cmd(shadowlength,1;halign,1;y,12),
		BeginCommand=function(self)
			local timeDiff = GetTimingDifficulty()+3
			local pref = PREFSMAN:GetPreference("TimingWindowScale")
			if timeDiff == 9 then
				local str = ScreenString("Justice (%.2f)")
				self:settext( string.format(str,pref) )
				self:diffuseshift()
				self:effectperiod(0.5)
				self:effectcolor1(color("1,0.75,0,1"))
				self:effectcolor2(color("1,0.9,0.45,1"))
			else
				local str = ScreenString("Judge %d (%.2f)")
				self:settext( string.format(str,timeDiff,pref) )
				self:stopeffect()
			end
		end,
	},
	LoadFont("_smallcaps 8px")..{
		Name="LifeDiff",
		InitCommand=cmd(shadowlength,1;halign,1;y,24),
		BeginCommand=function(self)
			local lifeDiff = GetLifeDifficulty()+3
			local pref = PREFSMAN:GetPreference("LifeDifficultyScale")
			local str = ScreenString("Life %d (%.2f)")
			self:settext( string.format(str,lifeDiff,pref) )

			if lifeDiff > 7 then
				-- new to SM5/SM5TE, not in 3.9
				self:settext( string.format(str,lifeDiff,pref) )
				self:diffuseshift()
				self:effectperiod(0.5)
				self:effectcolor1(color("1,0.75,0,1"))
				self:effectcolor2(color("1,0.9,0.45,1"))
			else
				self:stopeffect()
			end
		end,
	},
	LoadFont("_smallcaps 8px")..{
		Name="Center1P",
		InitCommand=cmd(shadowlength,1;halign,1;y,36),
		BeginCommand=function(self)
			local set = tostring(ThemePrefs.Get("Center1Player"))
			local status = (set == "true") and THEME:GetString("OptionNames","On") or THEME:GetString("OptionNames","Off")
			local str = ScreenString("Center1Player: %s")
			self:settext( string.format( str,string.upper(status) ) )
		end,
	},
	LoadFont("_smallcaps 8px")..{
		Name="AutoSetStyle",
		InitCommand=cmd(shadowlength,1;halign,1;y,48),
		BeginCommand=function(self)
			local set = tostring(ThemePrefs.Get("AutoSetStyle"))
			local status = (set == "true") and THEME:GetString("OptionNames","On") or THEME:GetString("OptionNames","Off")
			local str = ScreenString("AutoSetStyle: %s")
			self:settext( string.format( str,string.upper(status) ) )
		end,
	},
	LoadFont("_smallcaps 8px")..{
		Name="PercentScoring",
		InitCommand=cmd(shadowlength,1;halign,1;y,60),
		BeginCommand=function(self)
			local set = tostring(ThemePrefs.Get("PercentageScoring"))
			local status = (set == "true") and THEME:GetString("OptionNames","On") or THEME:GetString("OptionNames","Off")
			local str = ScreenString("PercentageScoring: %s")
			self:settext( string.format( str,string.upper(status) ) )
		end,
	},
};