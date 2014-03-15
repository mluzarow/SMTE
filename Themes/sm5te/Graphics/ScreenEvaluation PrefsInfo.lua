return Def.ActorFrame{
	LoadFont("_smallcaps 8px")..{
		Name="JudgeDiff",
		InitCommand=cmd(shadowlength,1;),
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
		OffCommand=cmd(linear,0.5;addy,SCREEN_CENTER_Y),
	},
	LoadFont("_smallcaps 8px")..{
		Name="LifeDiff",
		InitCommand=cmd(shadowlength,1;y,10),
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
		OffCommand=cmd(linear,0.4;addy,SCREEN_CENTER_Y),
	},
};