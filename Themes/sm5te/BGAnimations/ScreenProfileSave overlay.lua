return Def.ActorFrame{
	Def.Actor{
		BeginCommand=function(self)
			if SCREENMAN:GetTopScreen():HaveProfileToSave() then self:sleep(0); end;
			self:queuecommand("Load");
		end;
		LoadCommand=function(self) SCREENMAN:GetTopScreen():Continue(); end;
	};
};