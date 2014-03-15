return Def.ActorFrame {
	LoadActor(THEME:GetPathG("_icon","Timing")) .. {
		InitCommand=cmd(x,-60;shadowlength,1);
	};
	LoadFont("Common Normal") .. {
		Text=string.format(Screen.String("TimingDifficulty"),"");
		InitCommand=cmd(x,-72+28;halign,0;zoom,0.5);
		OnCommand=cmd(shadowlength,1);
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(x,72*0.75+10;zoom,0.875;shadowlength,1;skewx,-0.125);
		BeginCommand=function(self)
			local timing = GetTimingDifficulty()
			timing = scale(timing, 1,6, 4,9)
			if timing == 9 then
				-- xxx: localized
				self:settext(Justice);
				(cmd(zoom,0.5;diffuse,ColorLightTone( Color("Orange")) ))(self)
			else
				self:settext(timing);
			end
		end;
	};
};