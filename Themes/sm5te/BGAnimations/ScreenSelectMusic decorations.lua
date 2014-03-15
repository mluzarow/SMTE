local t = LoadFallbackB()

t[#t+1] = StandardDecorationFromFile("BannerFrame","BannerFrame")
t[#t+1] = StandardDecorationFromFile("SelectionInfo","SelectionInfo")
t[#t+1] = StandardDecorationFromFile("SongOptions","SongOptions")
t[#t+1] = StandardDecorationFromFile("StageDisplay","StageDisplay")
t[#t+1] = StandardDecorationFromFile("SortDisplay","SortDisplay")

-- per-player elements
for pn in ivalues(PlayerNumber) do
	local MetricsName = ""

	if not GAMESTATE:IsCourseMode() then
		MetricsName = "SegmentDisplay"..PlayerNumberToString(pn);
		t[#t+1] = LoadActor(THEME:GetPathG("ScreenSelectMusic","SegmentDisplay"),pn)..{
			Name=MetricsName;
			InitCommand=function(self)
				self:player(pn);
				ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen")
			end;
			PlayerJoinedMessageCommand=function(self, params)
				if params.Player == pn then self:visible(true) end;
			end;
			PlayerUnjoinedMessageCommand=function(self, params)
				if params.Player == pn then self:visible(false) end;
			end;
		};

		MetricsName = "GradeDisplay"..PlayerNumberToString(pn);
		t[#t+1] = LoadActor(THEME:GetPathG("ScreenSelectMusic","GradeDisplay"),pn)..{
			Name=MetricsName;
			InitCommand=function(self)
				self:player(pn);
				ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen")
			end;
			PlayerJoinedMessageCommand=function(self, params)
				if params.Player == pn then self:visible(true) end;
			end;
			PlayerUnjoinedMessageCommand=function(self, params)
				if params.Player == pn then self:visible(false) end;
			end;
		};
	end

	-- absence plate (for rival usage, etc.)
	MetricsName = "AbsenceDisplay"..PlayerNumberToString(pn);
	t[#t+1] = LoadActor(THEME:GetPathG("ScreenSelectMusic","AbsenceDisplay"),pn)..{
		Name=MetricsName;
		InitCommand=function(self)
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen")
		end;
	};

	MetricsName = "StatFrame"..PlayerNumberToString(pn);
	t[#t+1] = LoadActor(THEME:GetPathG("ScreenSelectMusic","StatFrame"),pn)..{
		Name=MetricsName;
		InitCommand=function(self)
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen")
		end;
	};
	MetricsName = "StatArea"..PlayerNumberToString(pn);
	t[#t+1] = LoadActor(THEME:GetPathG("ScreenSelectMusic","StatArea"),pn)..{
		Name=MetricsName;
		InitCommand=function(self)
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen")
		end;
	};

	MetricsName = "StepsDisplay"..PlayerNumberToString(pn);
	t[#t+1] = LoadActor(THEME:GetPathG("ScreenSelectMusic","StepsDisplay"),pn)..{
		Name=MetricsName;
		InitCommand=function(self)
				self:player(pn);
				ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen")
			end;
			PlayerJoinedMessageCommand=function(self, params)
				if params.Player == pn then self:visible(true) end;
			end;
			PlayerUnjoinedMessageCommand=function(self, params)
				if params.Player == pn then self:visible(false) end;
			end;
	};
end

return t