-- stat frame; per-player
local Player = ...
assert(Player,"StatFrame needs Player")

local zoomY = Player == PLAYER_1 and 1 or -1

return Def.ActorFrame{
	PlayerJoinedMessageCommand=function(self, params)
		if params.Player == Player then self:visible(true) end;
	end;
	PlayerUnjoinedMessageCommand=function(self, params)
		if params.Player == Player then self:visible(false) end;
	end;

	LoadActor(THEME:GetPathG("_selmusic","statframe fill"))..{
		InitCommand=cmd(zoomy,zoomY;diffuse,PlayerColor(Player););
		BeginCommand=cmd(glowshift;effectperiod,2;effectcolor1,color("1,1,1,0");effectcolor2,color("1,1,1,0.075"));
		OnCommand=function(self)
			if Player == PLAYER_1 then
				self:cropbottom(1)
				self:fadebottom(1)
			else
				self:croptop(1)
				self:fadetop(1)
			end
			self:sleep(0.6)
			self:linear(0.15)
			if Player == PLAYER_1 then
				self:cropbottom(0)
				self:fadebottom(0)
			else
				self:croptop(0)
				self:fadetop(0)
			end
		end;
	};
	LoadActor(THEME:GetPathG("_selmusic","statframe outline"))..{
		InitCommand=cmd(zoomy,zoomY;);
		OnCommand=function(self)
			if Player == PLAYER_1 then
				self:cropbottom(1)
				self:fadebottom(1)
			else
				self:croptop(1)
				self:fadetop(1)
			end
			self:sleep(0.6)
			self:linear(0.15)
			if Player == PLAYER_1 then
				self:cropbottom(0)
				self:fadebottom(0)
			else
				self:croptop(0)
				self:fadetop(0)
			end
		end;
	};
};