local x = Def.ActorFrame{
	Def.Actor{
		BeginCommand=function(self)
			if SCREENMAN:GetTopScreen():HaveProfileToLoad() then self:sleep(0); end;
			self:queuecommand("Load");
		end;
		LoadCommand=function(self)
			SCREENMAN:GetTopScreen():Continue();
		end;
		OffCommand=function(self) MESSAGEMAN:Broadcast("SetMemCardSprite") end;
	};
};
return x;