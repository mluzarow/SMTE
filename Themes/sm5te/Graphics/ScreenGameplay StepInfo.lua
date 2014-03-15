-- gameplay steps display; per-player
assert(Player,"gameplay StepsDisplay needs Player")
local Player = ...

local c
local playerMul = (Player == PLAYER_2) and -1 or 1

return Def.ActorFrame{
	InitCommand=function(self) c = self:GetChildren(); end;
	BeginCommand=cmd(playcommand,"Set");

	--[[
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	CurrentStepsP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
	CurrentTrailP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
	CurrentStepsP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
	CurrentTrailP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
	--]]
	-- xxx: handle course song changes

	SetCommand=function(self)
		local diffText = "gtfo"
		local meterText = "0"
		local panelText = "[?]"
		local SongCourse, StepsTrail
		local diffColor = color("#FFFFFF")

		if GAMESTATE:IsCourseMode() then
			-- it's not done
			SongCourse = GAMESTATE:GetCurrentCourse()
			if SongCourse then
				StepsTrail = GAMESTATE:GetCurrentTrail(Player)
				if StepsTrail then
					diffText = GetCustomDifficulty(StepsTrail:GetStepsType(),StepsTrail:GetDifficulty(),SongCourse:GetCourseType())
					c.DifficultyName:diffuse(CustomDifficultyToColor(diffText))
					c.DifficultyName:shadowcolor( BoostColor(CustomDifficultyToColor(diffText),0.4) )
					meterText = StepsTrail:GetMeter()
					c.DifficultyMeter:diffuse(CustomDifficultyToColor(diffText))
					c.DifficultyMeter:shadowcolor( BoostColor(CustomDifficultyToColor(diffText),0.4) )
				else
					diffText = "no trail"
					meterText = "0"
				end
			else
				diffText = ""
				meterText = ""
				panelText = ""
			end
		else
			SongCourse = GAMESTATE:GetCurrentSong()
			if SongCourse then
				StepsTrail = GAMESTATE:GetCurrentSteps(Player)
				if StepsTrail then
					local st = StepsTrail:GetStepsType()
					local diff = StepsTrail:GetDifficulty()

					diffText = GetCustomDifficulty(st,diff,nil)
					c.DifficultyName:diffuse(CustomDifficultyToColor(diffText))
					c.DifficultyName:shadowcolor( BoostColor(CustomDifficultyToColor(diffText),0.4) )

					meterText = StepsTrail:GetMeter()
					c.DifficultyMeter:diffuse(CustomDifficultyToColor(diffText))
					c.DifficultyMeter:shadowcolor( BoostColor(CustomDifficultyToColor(diffText),0.4) )

					-- fix for things
					if diff == 'Difficulty_Edit' and StepsTrail:GetDescription() ~= "" then
						diffText = StepsTrail:GetDescription()
					else
						diffText = CustomDifficultyToLocalizedString(GetCustomDifficulty(st,diff,nil))
					end

					panelText = THEME:GetString("GameplayPanel",ToEnumShortString(st))
				else
					diffText = "no steps"
					meterText = "0"
				end
			else
				diffText = ""
				meterText = ""
				panelText = ""
			end
		end
		c.DifficultyName:settext(diffText)
		c.DifficultyMeter:settext(meterText)
		c.Panels:settext(panelText)
	end;

	LoadActor(THEME:GetPathG("_gameplay","difficultyframe"))..{
		InitCommand=cmd();
	};

	LoadFont("_smallcaps 8px")..{
		Name="Panels";
		InitCommand=cmd(x,-56.5;halign,1;shadowlength,1;diffusebottomedge,color("#BBBBBB"));
	};
	LoadFont("_smallcaps 8px")..{
		Name="DifficultyName";
		InitCommand=cmd(x,-50.5;halign,0;shadowlength,1;);
	};
	LoadFont("_smallcaps 8px")..{
		Name="DifficultyMeter";
		InitCommand=cmd(x,88.5;halign,1;shadowlength,1;);
	};
};