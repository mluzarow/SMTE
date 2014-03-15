local tier = ...
assert(tier,"_eval grade requires tier")

local tierToFrame = {
	Tier01 = 0,
	Tier02 = 1,
	Tier03 = 2,
	Tier04 = 3,
	Tier05 = 4,
	Tier06 = 5,
	Tier07 = 6,
	Failed = 7,
}

return Def.ActorFrame{
	LoadActor(THEME:GetPathG("_eval","boxgrade"))..{
		InitCommand=cmd(pause;setstate,tierToFrame[tier]);
	};
};