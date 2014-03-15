local option = ThemePrefs.Get("GameplayFooter")
if option == "Off" then return Def.ActorFrame{} end

local frameFile = (option == "ScoreOnly") and "_scores" or "_full"
return Def.ActorFrame{
	LoadActor(frameFile)..{ InitCommand=cmd(valign,1); };
};
