local t = Def.ActorFrame{};

t[#t+1] = StandardDecorationFromFile("LifeFrame","LifeFrame")
t[#t+1] = StandardDecorationFromFile("ScoreFrame","ScoreFrame")

t[#t+1] = StandardDecorationFromFile("SongMeter","SongMeter")
--t[#t+1] = StandardDecorationFromFile("NowPlaying","NowPlaying")

-- stepping displays
for pn in ivalues(PlayerNumber) do
	t[#t+1] = LoadActor(THEME:GetPathG("ScreenGameplay","StepInfo"),pn)..{
		Name="StepInfo"..PlayerNumberToString(pn);
		InitCommand=function(self)
			self:player(pn);
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen")
		end;
	};
end

return t