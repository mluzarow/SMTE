local t = LoadActor(THEME:GetPathB("ScreenEvaluation","decorations"));

-- 2p-specific crap begins here
t[#t+1] = StandardDecorationFromFile("JudgeLabels","JudgeLabels")

for pn in ivalues(PlayerNumber) do
	t[#t+1] = LoadActor(THEME:GetPathG("ScreenGameplay","StepInfo"),pn)..{
		Name="StepInfo"..PlayerNumberToString(pn);
		InitCommand=function(self)
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen")
		end;
	};
end

return t