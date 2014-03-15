return Def.ActorFrame{
	Def.ActorFrame{
		Name="MainLogo",
		InitCommand=cmd(y,-48),
		LoadActor("_stepmania")..{
			Name="StepMania",
			InitCommand=cmd(x,-57;y,8;),
		},
		LoadActor("_5")..{
			Name="five",
			InitCommand=cmd(x,200;y,-2;),
			OnCommand=cmd(pulse;effectperiod,1.5;effectmagnitude,1,1.1,0;effecttiming,0.25,0.125,0.5,0.125;),
		},
	},
	Def.ActorFrame{
		Name="TournamentEditionText",

		LoadActor("_te main")..{
			Name="Main",
			InitCommand=cmd(),
		},
	},
};