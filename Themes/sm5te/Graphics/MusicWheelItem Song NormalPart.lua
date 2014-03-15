local darkColor = color("#777777")
local lightColor = color("#999999")

local leftColors = {
	Odd = lightColor,
	Even = darkColor
}
local rightColors = {
	Odd = darkColor,
	Even = lightColor
}

return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(zoomto,300,40;);
		SetMessageCommand=function(self,param)
			if param.Index % 2 == 0 then
				self:diffuse(leftColors.Even)
			else
				self:diffuse(leftColors.Odd)
			end
		end;
	};
	--[[
	Def.ActorFrame{
		Name="Base";
		LoadActor(THEME:GetPathG("_song base","left"))..{
			SetMessageCommand=function(self,param)
				if param.Index % 2 == 0 then
					self:diffuse(leftColors.Even)
				else
					self:diffuse(leftColors.Odd)
				end
			end;
		};
		LoadActor(THEME:GetPathG("_song base","right"))..{
			SetMessageCommand=function(self,param)
				if param.Index % 2 == 0 then
					self:diffuse(rightColors.Even)
				else
					self:diffuse(rightColors.Odd)
				end
			end;
		};
	};
	--]]
	Def.Quad{
		Name="Border";
		InitCommand=cmd(zoomto,300,2;diffuse,color("#444444");valign,1;y,20);
	};

	Def.Quad{
		Name="LeftSep";
		InitCommand=cmd(x,-140;y,-1;zoomto,2,40;diffuse,color("#444444");fadetop,0.025;fadebottom,0.025);
	};
	Def.Quad{
		Name="RightSep";
		InitCommand=cmd(x,140;y,-1;zoomto,2,40;diffuse,color("#444444");fadetop,0.025;fadebottom,0.025);
	};
};