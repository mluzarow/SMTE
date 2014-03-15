local timingScales = { 1.0, 0.8, 0.6, 0.4, 0.33, 0.25 }

return Def.ActorFrame {
	LoadActor(THEME:GetPathG("_icon","Health")) .. {
		InitCommand=cmd(x,-60;shadowlength,1);
	};
	LoadFont("Common Normal") .. {
		Text=string.format(Screen.String("LifeDifficulty"), "");
		InitCommand=cmd(x,-72+28;horizalign,left;zoom,0.5);
		OnCommand=cmd(shadowlength,1);
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(x,72*0.65;zoom,0.875);
		OnCommand=cmd(shadowlength,1;skewx,-0.125);
		BeginCommand=function(self)
			local life = GetLifeDifficulty()
			self:settextf("%.2f",timingScales[life]);
		end;
	};
};