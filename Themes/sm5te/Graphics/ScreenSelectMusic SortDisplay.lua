return Def.ActorFrame{
	LoadFont("_smallcaps 8px")..{
		InitCommand=cmd(halign,1;shadowlength,1);
		BeginCommand=cmd(playcommand,"Set");
		SetCommand=function(self)
			local curSort = GAMESTATE:GetSortOrder();
			local sortString = ToEnumShortString(curSort)
			self:settext( string.lower( THEME:GetString("SortOrder",sortString) ) )
			self:diffuse( SortOrderColors[sortString] )
		end;
		SortOrderChangedMessageCommand=cmd(playcommand,"Set");
	};
};