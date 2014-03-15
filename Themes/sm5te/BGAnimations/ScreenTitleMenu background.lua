local maskHeight = 44

local bgColorIdx = 1
local bgFadeSeconds = 5
local bgFadeWaitSeconds = 1.5
local bgColors = {
	HSV(0,1,0.2),
	HSV((360/7)*1,1,0.35),
	HSV((360/7)*2,1,0.35),
	HSV((360/7)*3,1,0.35),
	HSV((360/7)*4,1,0.35),
	HSV((360/7)*5,1,0.35),
	HSV((360/7)*6,1,0.35),
}

return Def.ActorFrame{
	-- super secret spy shit volume III
	OnCommand=function(self)
		InitGameEnvs()
		ThemePrefs.Save()
		MESSAGEMAN:Broadcast("ResetCardDisplay")
	end;

	LoadActor(THEME:GetPathG("_bg","b"))..{
		InitCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT*1.33;customtexturerect,0,0,SCREEN_WIDTH/self:GetWidth(),(SCREEN_HEIGHT*1.33)/self:GetHeight();texcoordvelocity,-5,0;bob;effectmagnitude,0,32,0;effectperiod,4);
	};

	Def.Quad{
		InitCommand=cmd(FullScreen;diffusecolor,color("#383838");diffusealpha,0.75);
		OnCommand=cmd(queuecommand,"CycleColor");
		CycleColorCommand=function(self)
			self:linear(bgFadeSeconds)
			self:diffusecolor(bgColors[bgColorIdx])

			bgColorIdx = bgColorIdx + 1
			if bgColorIdx > #bgColors then
				bgColorIdx = 1
			end
			self:sleep(bgFadeWaitSeconds)
			self:queuecommand("CycleColor")
		end;
	};

	Def.Quad{
		Name="TopMask";
		InitCommand=cmd(CenterX;y,SCREEN_TOP;valign,0;zoomto,SCREEN_WIDTH,maskHeight;MaskSource;fadebottom,0.05);
	};
	Def.Quad{
		Name="BottomMask";
		InitCommand=cmd(CenterX;y,SCREEN_BOTTOM;valign,1;zoomto,SCREEN_WIDTH,maskHeight;zwrite,true;blend,'BlendMode_NoEffect';fadetop,0.05);
	};

	Def.ActorFrame{
		Name="MiddleArea";
		InitCommand=cmd(Center);
		LoadActor(THEME:GetPathG("_bg","a"))..{
			InitCommand=cmd(zoomto,SCREEN_WIDTH,300;customtexturerect,0,0,SCREEN_WIDTH/self:GetWidth(),2;diffusealpha,0.25;texcoordvelocity,-0.625,0;fadetop,0.1;fadebottom,0.1;MaskDest;);
		};
		Def.Quad{
			InitCommand=cmd(zoomto,SCREEN_WIDTH,320;diffuse,color("#66666666");fadetop,0.1;fadebottom,0.1;blend,Blend.Add;);
		};
	};

	Def.Quad{
		InitCommand=cmd(CenterX;y,SCREEN_TOP;valign,0;zoomto,SCREEN_WIDTH,32;diffuse,color("0,0,0,0.75");fadebottom,2);
	};
	Def.Quad{
		InitCommand=cmd(CenterX;y,SCREEN_BOTTOM;valign,1;zoomto,SCREEN_WIDTH,32;diffuse,color("0,0,0,0.75");fadetop,2);
	};
};