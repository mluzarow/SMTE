local sString;
local t = Def.ActorFrame{
--[[ 	LoadActor("TestStep") .. {
		InitCommand=cmd(zoomto,20,20);
	}; --]]
	LoadFont("Common normal")..{
		InitCommand=cmd(shadowlength,1;horizalign,left;zoom,0.45;skewx,-0.125);
		SetMessageCommand=function(self,param)
			sString = THEME:GetString("StepsListDisplayRow StepsType",ToEnumShortString(param.StepsType));
			self:diffuse(Color("White"));
			self:settext( sString );
		end;
	};
	-- argh this isn't working as nicely as I would've hoped...
	--[[
	Def.Sprite{
		SetMessageCommand=function(self,param)
			self:Load( THEME:GetPathG("","_StepsType/"..ToEnumShortString(param.StepsType)) );
			self:diffusealpha(0.5);
		end;
	};
	--]]
};

return t;