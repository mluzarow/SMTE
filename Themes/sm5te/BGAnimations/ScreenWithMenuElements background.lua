local maskHeight = 44

local bgColorIdx = 1
local bgFadeSeconds = 3.5
local bgFadeWaitSeconds = 1.25
local bgColors = {
	HSV(0,1,0.45),
	HSV((360/7)*1,1,0.45),
	HSV((360/7)*2,1,0.45),
	HSV((360/7)*3,1,0.45),
	HSV((360/7)*4,1,0.45),
	HSV((360/7)*5,1,0.45),
	HSV((360/7)*6,1,0.45),
}

return Def.ActorFrame{
	Def.ActorFrame{
		LoadActor(THEME:GetPathG("_bg","b"))..{
			Name="Vertical";
			InitCommand=cmd(Center;zoomto,SCREEN_WIDTH*1.5,SCREEN_HEIGHT*1.5;customtexturerect,0,0,SCREEN_WIDTH*1.5/self:GetWidth(),SCREEN_HEIGHT*1.5/self:GetHeight();texcoordvelocity,0,1;diffuse,color("0.25,0.25,0.25,0.9"));
		};
		LoadActor(THEME:GetPathG("_bg","b"))..{
			Name="Horizontal";
			InitCommand=cmd(Center;zoomto,SCREEN_WIDTH*3,SCREEN_HEIGHT*3;customtexturerect,0,0,SCREEN_WIDTH*3/(self:GetWidth()/2),SCREEN_HEIGHT*3/(self:GetHeight()/2);texcoordvelocity,-3,0;diffuse,color("0.5,0.5,0.5,0.35");blend,Blend.Add);
		};
	};

	Def.ActorFrame{
		InitCommand=cmd(fov,75;);
		LoadActor(THEME:GetPathG("_bg","b"))..{
			Name="Top";
			InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-64;zoomto,SCREEN_WIDTH*1.75,SCREEN_HEIGHT*1.75;customtexturerect,0,0,SCREEN_WIDTH*1.75/self:GetWidth(),SCREEN_HEIGHT*1.5/self:GetHeight();texcoordvelocity,0,-3;);
			OnCommand=cmd(diffuse,color("0.5,0.5,0.5,1");rotationx,-95;);
		};
		LoadActor(THEME:GetPathG("_bg","b"))..{
			Name="Bottom";
			InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+64;zoomto,SCREEN_WIDTH*1.75,SCREEN_HEIGHT*1.75;customtexturerect,0,0,SCREEN_WIDTH*1.75/self:GetWidth(),SCREEN_HEIGHT*1.5/self:GetHeight();texcoordvelocity,0,3;);
			OnCommand=cmd(diffuse,color("0.5,0.5,0.5,1");rotationx,95;);
		};
		-- not sure if this should be kept...
		--[[
		LoadActor(THEME:GetPathG("_bg","c"))..{
			Name="Bottom2";
			InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y+64;zoomto,SCREEN_WIDTH*1.75,SCREEN_HEIGHT*1.75;customtexturerect,0,0,SCREEN_WIDTH*1.75/self:GetWidth(),SCREEN_HEIGHT*1.5/self:GetHeight();texcoordvelocity,0,4.5;rotationx,95;blend,Blend.Subtract);
			OnCommand=cmd(diffuseshift;effectcolor1,color("0.6,0.6,0.6,0.25");effectcolor2,color("0.5,0.5,0.5,0.05");effectperiod,4);
		};
		--]]
	};

	Def.Quad{
		InitCommand=cmd(Center;valign,1;zoomto,SCREEN_WIDTH,32;diffuse,color("0,0,0,0.625");fadetop,0.75);
	};
	Def.Quad{
		InitCommand=cmd(Center;valign,0;zoomto,SCREEN_WIDTH,32;diffuse,color("0,0,0,0.625");fadebottom,0.75);
	};
	LoadActor(THEME:GetPathG("_bg","a"))..{
		InitCommand=cmd(Center;zoomto,SCREEN_WIDTH*1.5,56;customtexturerect,0,0,SCREEN_WIDTH*1.5/self:GetWidth(),self:GetHeight()/2;texcoordvelocity,0,-0.5;diffuse,color("0.2,0.2,0.2,0.7");diffuseleftedge,color("0,0,0,0.35");diffuserightedge,color("0,0,0,0.35");fadetop,0.5;fadebottom,0.5);
	};

	Def.Quad{
		InitCommand=cmd(FullScreen;diffusecolor,bgColors[1];diffusealpha,0.35;blend,Blend.Add);
		OnCommand=cmd(queuecommand,"CycleColor");
		CycleColorCommand=function(self)
			bgColorIdx = bgColorIdx + 1
			if bgColorIdx > #bgColors then
				bgColorIdx = 1
			end

			self:linear(bgFadeSeconds)
			self:diffusecolor(bgColors[bgColorIdx])

			self:sleep(bgFadeWaitSeconds)
			self:queuecommand("CycleColor")
		end;
	};
};