return Def.ActorFrame{
	-- fade out should only run on the credits item.
	-- every other option is unknown.

	--[[
	LoadActor(THEME:GetPathB("_fade","out"))..{
		OnCommand=function(self)
			local loadScreen = Var "LoadingScreen"
			if loadScreen then
				Trace("loading screen = "..loadScreen)
			end
		end;
	};
	--]]
};