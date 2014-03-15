return Def.ActorFrame{
	-- transition from title menu
	-- (todo: don't do this on operator menu button?)
	LoadActor(THEME:GetPathB("_menu","in"))..{
		BeginCommand=function(self)
			local prevScreen = Var "PreviousScreen"
			if prevScreen then
				self:visible(prevScreen == "ScreenTitleMenu")
			end
		end;
	};
	-- transition from other screens
};