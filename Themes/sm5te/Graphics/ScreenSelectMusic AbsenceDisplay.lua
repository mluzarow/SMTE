-- absence display; per-player
local Player = ...
assert(Player,"AbsenceDisplay needs Player")

local zoomY = Player == PLAYER_1 and 1 or -1

return Def.ActorFrame{
	PlayerJoinedMessageCommand=function(self, params)
		if params.Player == Player then self:visible(false) end;
	end;
	PlayerUnjoinedMessageCommand=function(self, params)
		if params.Player == Player then self:visible(true) end;
	end;

	Def.ActorFrame{
		Name="MainFrame";
		BeginCommand=function(self)
			-- determine visibility
			self:visible( not GAMESTATE:IsSideJoined(Player) )
		end;

		LoadActor(THEME:GetPathG("_selmusic","absence"))..{
			InitCommand=cmd(zoomy,zoomY;);
		};

		--[[
		LoadFont("_smallcaps 8px")..{
			InitCommand=cmd(x,2;);
			BeginCommand=cmd(settext,"absence");
		};
		--]]
	};
};