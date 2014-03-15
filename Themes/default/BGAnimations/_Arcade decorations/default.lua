local t = Def.ActorFrame {};
t.InitCommand=function(self)
	self:name("ArcadeOverlay")
	ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen")
end;
t[#t+1] = Def.ActorFrame {
	Name="ArcadeOverlay.Text";
	InitCommand=function(self)
		ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen")
	end;
	LoadActor(THEME:GetPathG("OptionRowExit","Frame")) .. {
		InitCommand=cmd(diffuse,Color("Orange");diffusealpha,0.35);
	};
	LoadFont("Common Normal") .. {
		InitCommand=cmd(zoom,0.75;shadowlength,1;glowshift;strokecolor,Color("Outline");diffuse,Color("Orange");diffusetopedge,Color("Yellow");textglowmode,'TextGlowMode_Inner');
		Text="";
		OnCommand=cmd(playcommand,"Refresh");
		CoinInsertedMessageCommand=cmd(playcommand,"Refresh");
		CoinModeChangedMessageCommand=cmd(playcommand,"Refresh");
		RefreshCommand=function(self)
			self:settext(THEME:GetString("ScreenTitleJoin","HelpTextJoin"));
		end;
	};
};
return t