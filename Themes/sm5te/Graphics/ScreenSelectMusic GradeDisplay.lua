-- grade display; per-player
local Player = ...
assert(Player,"GradeDisplay needs Player")

-- overridin' ass mofos
--[[
local function FormatPercentScore(score)
	return string.format("% 2.2f%%",score*100)
end
--]]

local isMachine = false

local xMult = Player == PLAYER_1 and -1 or 1
local xOffset = 40
local playerAlign = Player == PLAYER_1 and 1 or 0
local machineAlign = Player == PLAYER_1 and 0 or 1

local GradeToFrame = {
	Grade_Tier01 = 0,
	Grade_Tier02 = 1,
	Grade_Tier03 = 2,
	Grade_Tier04 = 3,
	Grade_Tier05 = 4,
	Grade_Tier06 = 5,
	Grade_Tier07 = 6,
	Grade_Failed = 7,
	Grade_NoData = 8
}

local bestString = ScreenString("best "..pname(Player))

return Def.ActorFrame{
	Def.ActorFrame{
		Name="YourBest";
		InitCommand=cmd(x,-70*xMult;);
		LoadFont("_smallcaps 8px")..{
			InitCommand=cmd(x,-61*xMult;y,16*xMult;halign,playerAlign;diffuse,PlayerColor(Player);shadowlength,1);
			BeginCommand=cmd(settext,bestString);
			OnCommand=cmd(diffusealpha,0;sleep,0.6;linear,0.15;diffusealpha,1);
		};

		LoadActor(THEME:GetPathG("_selmusic","grades"))..{
			Name="GradeIcon";
			InitCommand=cmd(pause;x,xOffset*-xMult);
			OnCommand=cmd(diffusealpha,0;sleep,0.6;linear,0.15;diffusealpha,1);
			SetCommand=function(self)
				local song = SongOrCourse()
				local steps,profile,scorelist,grade

				if song then
					self:visible(true)
					steps = StepsOrTrail(Player)
					if steps then
						profile = GetPlayerProfile(Player);
						if not profile then
							profile = PROFILEMAN:GetMachineProfile()
							isMachine = true
						else
							isMachine = false
						end

						if isMachine then
							grade = 'Grade_NoData'
						else
							scorelist = profile:GetHighScoreList(song,steps);
							assert(scorelist);
							local scores = scorelist:GetHighScores();
							local topscore = scores[1];
							if topscore then
								grade = topscore:GetGrade()
							else
								grade = 'Grade_NoData'
							end
						end
					else
						grade = 'Grade_NoData'
					end
					self:setstate(GradeToFrame[grade])
				else
					self:visible(false)
				end
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentStepsP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
			CurrentStepsP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
		};
		LoadFont("_smallcaps 8px")..{
			Name="ScoreText";
			InitCommand=cmd(x,20*-xMult;y,5;halign,playerAlign;shadowlength,1);
			OnCommand=cmd(diffusealpha,0;sleep,0.6;linear,0.15;diffusealpha,1);
			SetCommand=function(self)
				local song = SongOrCourse()
				local steps,profile,scorelist,scoretext
				if song then
					steps = StepsOrTrail(Player)
					if steps then
						profile = GetPlayerProfile(Player);
						if not profile then
							profile = PROFILEMAN:GetMachineProfile()
							isMachine = true
						else
							isMachine = false
						end

						if isMachine then
							scoretext = FormatPercentScore(0)
						else
							scorelist = profile:GetHighScoreList(song,steps);
							assert(scorelist);
							local scores = scorelist:GetHighScores();
							local topscore = scores[1];
							if topscore then
								scoretext = FormatPercentScore(topscore:GetPercentDP())
							else
								scoretext = FormatPercentScore(0)
							end
						end
					else
						scoretext = ""
					end
				else
					scoretext = ""
				end
				self:settext(scoretext)
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentStepsP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
			CurrentStepsP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
		};
		LoadFont("_smallcaps 8px")..{
			Name="NameText";
			InitCommand=cmd(x,20*-xMult;y,-4;halign,playerAlign;shadowlength,1);
			OnCommand=cmd(diffusealpha,0;sleep,0.6;linear,0.15;diffusealpha,1);
			SetCommand=function(self)
				local song = SongOrCourse()
				local steps,profile,scorelist,nametext
				if song then
					steps = StepsOrTrail(Player)
					if steps then
						profile = GetPlayerProfile(Player);
						if not profile then
							profile = PROFILEMAN:GetMachineProfile()
							isMachine = true
						else
							isMachine = false
						end

						if isMachine then
							nametext = "no data"
						else
							scorelist = profile:GetHighScoreList(song,steps);
							assert(scorelist);
							local scores = scorelist:GetHighScores();
							local topscore = scores[1];
							if topscore then
								nametext = topscore:GetName()
							else
								nametext = "no data"
							end
						end
					else
						nametext = ""
					end
				else
					nametext = ""
				end
				self:settext(nametext)
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentStepsP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
			CurrentStepsP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
		};
	};

	-- machine best score --
	Def.ActorFrame{
		Name="MachineBest";
		InitCommand=cmd(x,70*xMult;);
		LoadFont("_smallcaps 8px")..{
			InitCommand=cmd(x,30*xMult;y,16*xMult;shadowlength,1);
			BeginCommand=cmd(settext,ScreenString("machine"));
			OnCommand=cmd(diffusealpha,0;sleep,0.6;linear,0.15;diffusealpha,1);
		};

		LoadActor(THEME:GetPathG("_selmusic","grades"))..{
			Name="GradeIcon";
			InitCommand=cmd(pause;x,xOffset*xMult);
			OnCommand=cmd(diffusealpha,0;sleep,0.6;linear,0.15;diffusealpha,1);
			SetCommand=function(self)
				local song = SongOrCourse()
				local steps,profile,scorelist,grade

				if song then
					self:visible(true)
					steps = StepsOrTrail(Player)
					if steps then
						profile = PROFILEMAN:GetMachineProfile()

						scorelist = profile:GetHighScoreList(song,steps);
						assert(scorelist);
						local scores = scorelist:GetHighScores();
						local topscore = scores[1];
						if topscore then
							grade = topscore:GetGrade()
						else
							grade = 'Grade_NoData'
						end
					else
						grade = 'Grade_NoData'
					end
					self:setstate(GradeToFrame[grade])
				else
					self:visible(false)
				end
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentStepsP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
			CurrentStepsP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
		};
		LoadFont("_smallcaps 8px")..{
			Name="ScoreText";
			InitCommand=cmd(x,19*xMult;y,5;halign,machineAlign;shadowlength,1);
			OnCommand=cmd(diffusealpha,0;sleep,0.6;linear,0.15;diffusealpha,1);
			SetCommand=function(self)
				local song = SongOrCourse()
				local steps,profile,scorelist,scoretext
				if song then
					steps = StepsOrTrail(Player)
					if steps then
						profile = PROFILEMAN:GetMachineProfile()

						scorelist = profile:GetHighScoreList(song,steps);
						assert(scorelist);
						local scores = scorelist:GetHighScores();
						local topscore = scores[1];
						if topscore then
							scoretext = FormatPercentScore(topscore:GetPercentDP())
						else
							scoretext = FormatPercentScore(0)
						end
					else
						scoretext = ""
					end
				else
					scoretext = ""
				end
				self:settext(scoretext)
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentStepsP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
			CurrentStepsP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
		};
		LoadFont("_smallcaps 8px")..{
			Name="NameText";
			InitCommand=cmd(x,19*xMult;y,-4;halign,machineAlign;shadowlength,1);
			OnCommand=cmd(diffusealpha,0;sleep,0.6;linear,0.15;diffusealpha,1);
			SetCommand=function(self)
				local song = SongOrCourse()
				local steps,profile,scorelist,nametext
				if song then
					steps = StepsOrTrail(Player)
					if steps then
						profile = PROFILEMAN:GetMachineProfile()

						scorelist = profile:GetHighScoreList(song,steps);
						assert(scorelist);
						local scores = scorelist:GetHighScores();
						local topscore = scores[1];
						if topscore then
							nametext = topscore:GetName()
						else
							nametext = "no data"
						end
					else
						nametext = ""
					end
				else
					nametext = ""
				end
				self:settext(nametext)
			end;
			CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
			CurrentStepsP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
			CurrentStepsP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
		};
	};
};