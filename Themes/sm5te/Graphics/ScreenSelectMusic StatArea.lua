-- stat area; per-player
local Player = ...
assert(Player,"StatArea needs Player")

local yOffset = (Player == PLAYER_1) and -8 or 7
local fallbackPaneValue = "...."
local flip = (Player == PLAYER_1) and 1 or -1

local function BarSanityCheck(val)
	val = math.min(42,val)
	val = math.max(0,val)
	return val
end

return Def.ActorFrame{
	InitCommand=cmd(player,Player);
	PlayerJoinedMessageCommand=function(self, params)
		if params.Player == Player then self:visible(true) end;
	end;
	PlayerUnjoinedMessageCommand=function(self, params)
		if params.Player == Player then self:visible(false) end;
	end;

	Def.ActorFrame{
		Name="AwardDisplay";
		InitCommand=cmd(x,-102;y,flip*24);
		LoadActor(THEME:GetPathG("_selmusic","awardbox"))..{
			OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,0.725;);
		};
	};

	Def.ActorFrame{
		Name="PaneishDisplay";
		InitCommand=cmd(y,yOffset;);

		-- column 1 (x,-128;)
		Def.ActorFrame{
			Name="Column1";
			InitCommand=cmd(x,-128);

			LoadFont("_smallcaps 8px")..{
				Name="Notes";
				InitCommand=cmd(halign,0;y,-16;shadowlength,1;diffuse,RadarCategoryColors['TapsAndHolds'].Main);
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
				SetCommand=function(self)
					local mainText = THEME:GetString("PaneishDisplay",self:GetName())
					local songCourse = SongOrCourse()
					local stepsTrail = StepsOrTrail(Player)
					local rv
					local val = fallbackPaneValue
					if songCourse then
						if stepsTrail then
							local rv = stepsTrail:GetRadarValues(Player)
							val = rv:GetValue('RadarCategory_TapsAndHolds')
						else
							val = fallbackPaneValue
						end
					else
						val = fallbackPaneValue
					end
					self:settext(mainText.." "..val)
				end;
				CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
				CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
				CurrentStepsP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentTrailP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentStepsP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
				CurrentTrailP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
			};
			LoadFont("_smallcaps 8px")..{
				Name="Jumps";
				InitCommand=cmd(halign,0;y,-7;shadowlength,1;diffuse,RadarCategoryColors['Jumps'].Main);
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
				SetCommand=function(self)
					local mainText = THEME:GetString("PaneishDisplay",self:GetName())
					local songCourse = SongOrCourse()
					local stepsTrail = StepsOrTrail(Player)
					local rv
					local val = fallbackPaneValue
					if songCourse then
						if stepsTrail then
							local rv = stepsTrail:GetRadarValues(Player)
							val = rv:GetValue('RadarCategory_Jumps')
						else
							val = fallbackPaneValue
						end
					else
						val = fallbackPaneValue
					end
					self:settext(mainText.." "..val)
				end;
				CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
				CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
				CurrentStepsP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentTrailP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentStepsP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
				CurrentTrailP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
			};
			LoadFont("_smallcaps 8px")..{
				Name="Holds";
				InitCommand=cmd(halign,0;y,2;shadowlength,1;diffuse,RadarCategoryColors['Holds'].Main);
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
				SetCommand=function(self)
					local mainText = THEME:GetString("PaneishDisplay",self:GetName())
					local songCourse = SongOrCourse()
					local stepsTrail = StepsOrTrail(Player)
					local rv
					local val = fallbackPaneValue
					if songCourse then
						if stepsTrail then
							local rv = stepsTrail:GetRadarValues(Player)
							val = rv:GetValue('RadarCategory_Holds')
						else
							val = fallbackPaneValue
						end
					else
						val = fallbackPaneValue
					end
					self:settext(mainText.." "..val)
				end;
				CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
				CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
				CurrentStepsP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentTrailP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentStepsP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
				CurrentTrailP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
			};
			LoadFont("_smallcaps 8px")..{
				Name="Rolls";
				InitCommand=cmd(halign,0;y,11;shadowlength,1;diffuse,RadarCategoryColors['Rolls'].Main);
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
				SetCommand=function(self)
					local mainText = THEME:GetString("PaneishDisplay",self:GetName())
					local songCourse = SongOrCourse()
					local stepsTrail = StepsOrTrail(Player)
					local rv
					local val = fallbackPaneValue
					if songCourse then
						if stepsTrail then
							local rv = stepsTrail:GetRadarValues(Player)
							val = rv:GetValue('RadarCategory_Rolls')
						else
							val = fallbackPaneValue
						end
					else
						val = fallbackPaneValue
					end
					self:settext(mainText.." "..val)
				end;
				CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
				CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
				CurrentStepsP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentTrailP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentStepsP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
				CurrentTrailP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
			};
			LoadFont("_smallcaps 8px")..{
				Name="Hands";
				InitCommand=cmd(halign,0;y,20;shadowlength,1;diffuse,RadarCategoryColors['Hands'].Main);
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
				SetCommand=function(self)
					local mainText = THEME:GetString("PaneishDisplay",self:GetName())
					local songCourse = SongOrCourse()
					local stepsTrail = StepsOrTrail(Player)
					local rv
					local val = fallbackPaneValue
					if songCourse then
						if stepsTrail then
							local rv = stepsTrail:GetRadarValues(Player)
							val = rv:GetValue('RadarCategory_Hands')
						else
							val = fallbackPaneValue
						end
					else
						val = fallbackPaneValue
					end
					self:settext(mainText.." "..val)
				end;
				CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
				CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
				CurrentStepsP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentTrailP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentStepsP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
				CurrentTrailP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
			};
		};
		-- column 2 (x,?;)
		Def.ActorFrame{
			Name="Column2";
			InitCommand=cmd(x,-32;);

			LoadFont("_smallcaps 8px")..{
				Name="Mines";
				InitCommand=cmd(halign,0;y,-16;shadowlength,1;diffuse,RadarCategoryColors['Mines'].Main);
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
				SetCommand=function(self)
					local mainText = THEME:GetString("PaneishDisplay",self:GetName())
					local songCourse = SongOrCourse()
					local stepsTrail = StepsOrTrail(Player)
					local rv
					local val = fallbackPaneValue
					if songCourse then
						if stepsTrail then
							local rv = stepsTrail:GetRadarValues(Player)
							val = rv:GetValue('RadarCategory_Mines')
						else
							val = fallbackPaneValue
						end
					else
						val = fallbackPaneValue
					end
					self:settext(mainText.." "..val)
				end;
				CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
				CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
				CurrentStepsP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentTrailP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentStepsP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
				CurrentTrailP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
			};
			LoadFont("_smallcaps 8px")..{
				Name="Lifts";
				InitCommand=cmd(halign,0;y,-7;shadowlength,1;diffuse,RadarCategoryColors['Lifts'].Main);
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
				SetCommand=function(self)
					local mainText = THEME:GetString("PaneishDisplay",self:GetName())
					local songCourse = SongOrCourse()
					local stepsTrail = StepsOrTrail(Player)
					local rv
					local val = fallbackPaneValue
					if songCourse then
						if stepsTrail then
							local rv = stepsTrail:GetRadarValues(Player)
							val = rv:GetValue('RadarCategory_Lifts')
						else
							val = fallbackPaneValue
						end
					else
						val = fallbackPaneValue
					end
					self:settext(mainText.." "..val)
				end;
				CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
				CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
				CurrentStepsP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentTrailP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentStepsP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
				CurrentTrailP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
			};
			LoadFont("_smallcaps 8px")..{
				Name="Fakes";
				InitCommand=cmd(halign,0;y,2;shadowlength,1;diffuse,RadarCategoryColors['Fakes'].Main;);
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
				SetCommand=function(self)
					local mainText = THEME:GetString("PaneishDisplay",self:GetName())
					local songCourse = SongOrCourse()
					local stepsTrail = StepsOrTrail(Player)
					local rv
					local val = fallbackPaneValue
					if songCourse then
						if stepsTrail then
							local rv = stepsTrail:GetRadarValues(Player)
							val = rv:GetValue('RadarCategory_Fakes')
						else
							val = fallbackPaneValue
						end
					else
						val = fallbackPaneValue
					end
					self:settext(mainText.." "..val)
				end;
				CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
				CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
				CurrentStepsP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentTrailP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentStepsP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
				CurrentTrailP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
			};
			LoadFont("_smallcaps 8px")..{
				Name="NPS";
				InitCommand=cmd(halign,0;y,14;shadowlength,1;);
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
				SetCommand=function(self)
					local mainText = THEME:GetString("PaneishDisplay",self:GetName())
					local songCourse = SongOrCourse()
					local stepsTrail = StepsOrTrail(Player)
					local rv
					local val = fallbackPaneValue
					if songCourse then
						if stepsTrail then
							local rv = stepsTrail:GetRadarValues(Player)
							local tapsJumps = rv:GetValue('RadarCategory_TapsAndHolds') + rv:GetValue('RadarCategory_Jumps')
							val = string.format("%.2f",tapsJumps/songCourse:GetStepsSeconds())
						else
							val = fallbackPaneValue
						end
					else
						val = fallbackPaneValue
					end
					self:settext(mainText.." "..val)
				end;
				CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
				CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
				CurrentStepsP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentTrailP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentStepsP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
				CurrentTrailP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
			};
		};
	};

	Def.ActorFrame{
		Name="RadarBars";
		InitCommand=cmd(x,80;y,yOffset;);
		BeginCommand=function(self)
			if Player == PLAYER_2 then
				self:addy(18)
			else
				self:addy(32)
			end
		end;

		Def.ActorFrame{
			Name="Stream";
			InitCommand=cmd(x,0);

			LoadFont("_smallcaps 8px")..{
				Text="S";
				InitCommand=cmd(shadowlength,1;diffuse,RadarCategoryColors['Stream'].Main);
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
			};
			Def.Quad{
				Name="BGMain";
				InitCommand=cmd(y,-8;zoomto,8,44;valign,1;diffuse,color("#222222"));
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
			};
			Def.Quad{
				Name="BGSecond";
				InitCommand=cmd(x,1;y,-8;zoomto,6,42;valign,1;diffuse,color("#666666");diffusebottomedge,RadarCategoryColors['Stream'].Dark);
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
			};
			Def.Quad{
				Name="Bar";
				InitCommand=cmd(x,1;y,-8;zoomto,6,0;valign,1;diffusecolor,RadarCategoryColors['Stream'].Main;diffusetopedge,Saturation(RadarCategoryColors['Stream'].Main,0.325);diffusealpha,0;);
				OnCommand=cmd(sleep,0.75;linear,0.25;diffusealpha,1);
				SetCommand=function(self)
					self:stoptweening()
					local song = SongOrCourse()
					local height = 0
					if song then
						local steps = StepsOrTrail(Player)
						if steps then
							local rv = steps:GetRadarValues(Player)
							height = rv:GetValue('RadarCategory_Stream') * 42
						else
							height = 0
						end
					else
						height = 0
					end
					self:bounceend(0.2)
					-- sanity
					height = BarSanityCheck(height)
					self:zoomy(height)
				end;
				CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
				CurrentStepsP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentStepsP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
			};
		};
		Def.ActorFrame{
			Name="Voltage";
			InitCommand=cmd(x,10);

			LoadFont("_smallcaps 8px")..{
				Text="V";
				InitCommand=cmd(shadowlength,1;diffuse,RadarCategoryColors['Voltage'].Main);
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
			};
			Def.Quad{
				Name="BGMain";
				InitCommand=cmd(y,-8;zoomto,8,44;valign,1;diffuse,color("#222222"));
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
			};
			Def.Quad{
				Name="BGSecond";
				InitCommand=cmd(x,1;y,-8;zoomto,6,42;valign,1;diffuse,color("#666666");diffusebottomedge,RadarCategoryColors['Voltage'].Dark);
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
			};
			Def.Quad{
				Name="Bar";
				InitCommand=cmd(x,1;y,-8;zoomto,6,0;valign,1;diffusecolor,RadarCategoryColors['Voltage'].Main;diffusetopedge,Saturation(RadarCategoryColors['Voltage'].Main,0.325);diffusealpha,0;);
				OnCommand=cmd(sleep,0.75;linear,0.25;diffusealpha,1);
				SetCommand=function(self)
					self:stoptweening()
					local song = SongOrCourse()
					local height = 0
					if song then
						local steps = StepsOrTrail(Player)
						if steps then
							local rv = steps:GetRadarValues(Player)
							height = rv:GetValue('RadarCategory_Voltage') * 42
						else
							height = 0
						end
					else
						height = 0
					end
					self:bounceend(0.2)
					-- sanity
					height = BarSanityCheck(height)
					self:zoomy(height)
				end;
				CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
				CurrentStepsP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentStepsP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
			};
		};
		Def.ActorFrame{
			Name="Air";
			InitCommand=cmd(x,20);

			LoadFont("_smallcaps 8px")..{
				Text="A";
				InitCommand=cmd(shadowlength,1;diffuse,RadarCategoryColors['Air'].Main);
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
			};
			Def.Quad{
				Name="BGMain";
				InitCommand=cmd(y,-8;zoomto,8,44;valign,1;diffuse,color("#222222"));
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
			};
			Def.Quad{
				Name="BGSecond";
				InitCommand=cmd(x,1;y,-8;zoomto,6,42;valign,1;diffuse,color("#666666");diffusebottomedge,RadarCategoryColors['Air'].Dark);
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
			};
			Def.Quad{
				Name="Bar";
				InitCommand=cmd(x,1;y,-8;zoomto,6,0;valign,1;diffusecolor,RadarCategoryColors['Air'].Main;diffusetopedge,Saturation(RadarCategoryColors['Air'].Main,0.325);diffusealpha,0;);
				OnCommand=cmd(sleep,0.75;linear,0.25;diffusealpha,1);
				SetCommand=function(self)
					self:stoptweening()
					local song = SongOrCourse()
					local height = 0
					if song then
						local steps = StepsOrTrail(Player)
						if steps then
							local rv = steps:GetRadarValues(Player)
							height = rv:GetValue('RadarCategory_Air') * 42
						else
							height = 0
						end
					else
						height = 0
					end
					self:bounceend(0.2)
					-- sanity
					height = BarSanityCheck(height)
					self:zoomy(height)
				end;
				CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
				CurrentStepsP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentStepsP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
			};
		};
		Def.ActorFrame{
			Name="Freeze";
			InitCommand=cmd(x,30);

			LoadFont("_smallcaps 8px")..{
				Text="F";
				InitCommand=cmd(shadowlength,1;diffuse,RadarCategoryColors['Freeze'].Main);
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
			};
			Def.Quad{
				Name="BGMain";
				InitCommand=cmd(y,-8;zoomto,8,44;valign,1;diffuse,color("#222222"));
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
			};
			Def.Quad{
				Name="BGSecond";
				InitCommand=cmd(x,1;y,-8;zoomto,6,42;valign,1;diffuse,color("#666666");diffusebottomedge,RadarCategoryColors['Freeze'].Dark);
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
			};
			Def.Quad{
				Name="Bar";
				InitCommand=cmd(x,1;y,-8;zoomto,6,0;valign,1;diffusecolor,RadarCategoryColors['Freeze'].Main;diffusetopedge,Saturation(RadarCategoryColors['Freeze'].Main,0.325);diffusealpha,0;);
				OnCommand=cmd(sleep,0.75;linear,0.25;diffusealpha,1);
				SetCommand=function(self)
					self:stoptweening()
					local song = SongOrCourse()
					local height = 0
					if song then
						local steps = StepsOrTrail(Player)
						if steps then
							local rv = steps:GetRadarValues(Player)
							height = rv:GetValue('RadarCategory_Freeze') * 42
						else
							height = 0
						end
					else
						height = 0
					end
					self:bounceend(0.2)
					-- sanity
					height = BarSanityCheck(height)
					self:zoomy(height)
				end;
				CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
				CurrentStepsP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentStepsP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
			};
		};
		Def.ActorFrame{
			Name="Chaos";
			InitCommand=cmd(x,40);

			LoadFont("_smallcaps 8px")..{
				Text="C";
				InitCommand=cmd(shadowlength,1;diffuse,RadarCategoryColors['Chaos'].Main);
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
			};
			Def.Quad{
				Name="BGMain";
				InitCommand=cmd(y,-8;zoomto,8,44;valign,1;diffuse,color("#222222"));
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
			};
			Def.Quad{
				Name="BGSecond";
				InitCommand=cmd(x,1;y,-8;zoomto,6,42;valign,1;diffuse,color("#666666");diffusebottomedge,RadarCategoryColors['Chaos'].Dark);
				OnCommand=cmd(diffusealpha,0;sleep,0.75;linear,0.25;diffusealpha,1);
			};
			Def.Quad{
				Name="Bar";
				InitCommand=cmd(x,1;y,-8;zoomto,6,0;valign,1;diffusecolor,RadarCategoryColors['Chaos'].Main;diffusetopedge,Saturation(RadarCategoryColors['Chaos'].Main,0.325);diffusealpha,0;);
				OnCommand=cmd(sleep,0.75;linear,0.25;diffusealpha,1);
				SetCommand=function(self)
					self:stoptweening()
					local song = SongOrCourse()
					local height = 0
					if song then
						local steps = StepsOrTrail(Player)
						if steps then
							local rv = steps:GetRadarValues(Player)
							height = rv:GetValue('RadarCategory_Chaos') * 42
						else
							height = 0
						end
					else
						height = 0
					end
					self:bounceend(0.2)
					-- sanity
					height = BarSanityCheck(height)
					self:zoomy(height)
				end;
				CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
				CurrentStepsP1ChangedMessageCommand=function(self) if Player == PLAYER_1 then self:playcommand("Set") end end;
				CurrentStepsP2ChangedMessageCommand=function(self) if Player == PLAYER_2 then self:playcommand("Set") end end;
			};
		};
	};
};