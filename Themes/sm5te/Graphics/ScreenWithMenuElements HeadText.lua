return Def.ActorFrame{
	LoadFont("_neogrey medium 24px")..{
		InitCommand=cmd(x,(SCREEN_CENTER_X-320)+16;y,17;zoom,22/24;halign,0;shadowlength,1.75;diffusebottomedge,color("0.8,0.8,0.8,1");NoStroke);
		BeginCommand=cmd(settext,THEME:GetString(Var "LoadingScreen","HeaderText"));
	};
	LoadFont("_smallcaps 8px")..{
		InitCommand=cmd(x,(SCREEN_CENTER_X-320)+20;y,35;halign,0;shadowlength,1.5;diffusebottomedge,color("0.8,0.8,0.8,1"););
		BeginCommand=function(self)
			if THEME:GetString(Var "LoadingScreen","HeaderSubtext") then
				-- freem hack to be awesome
				if THEME:GetString(Var "LoadingScreen","HeaderSubtext") == "Metrics" then
					THEME:GetMetric(Var "LoadingScreen","HeaderSubtextOnCommand")(self)
				else
					self:settext( THEME:GetString(Var "LoadingScreen","HeaderSubtext") )
				end
			end
		end;
	};
};