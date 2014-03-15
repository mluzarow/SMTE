-- Evaluation for one player
local t = LoadActor(THEME:GetPathB("ScreenEvaluation","decorations"));

t[#t+1] = StandardDecorationFromFile("JudgeLabels","JudgeLabels")
t[#t+1] = StandardDecorationFromFile("DetailLabels","DetailLabels")

-- 1p-specific crap begins here
local pn = GAMESTATE:GetMasterPlayerNumber()

t[#t+1] = LoadActor(THEME:GetPathG("ScreenGameplay","StepInfo"),pn)..{
	Name="StepInfo"..PlayerNumberToString(pn);
	InitCommand=function(self)
		ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen")
	end;
};

return t