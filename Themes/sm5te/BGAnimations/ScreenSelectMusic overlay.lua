local frameInTime = 1
local frameOutTime = 0.5
local showFrameTime = 1.15

return Def.ActorFrame{
	-- display over everything
	--[[
	Def.Quad{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-8;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT-(52+68);diffuse,color("0.2,0.2,0.2,0"));
		OnCommand=cmd(linear,frameInTime;diffusealpha,0.75;sleep,showFrameTime;linear,frameOutTime;diffusealpha,0);
	};
	--]]
};