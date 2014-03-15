return Def.ActorFrame{
	LoadFont("_smallcaps 8px")..{
		InitCommand=cmd(halign,0;shadowlength,1),
		BeginCommand=function(self)
			local curStage = GAMESTATE:GetCurrentStage()
			local stageText = ""
			if curStage ~= 'Stage_Event' then stageText = tostring(curStage) end
			self:settext(stageText)
		end,
	};
};