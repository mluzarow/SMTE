-- todo: localize text
local showFrameTime = 2.25
local showTextTime = showFrameTime*0.8125

local frameInTime = 0.1
local frameOutTime = 0.25

local showTextDelay = 0.1
local fadeInTextTime = 0.25
local fadeOutTextTime = 0.25

local function noProfile(pn)
	local profile = PROFILEMAN:GetProfile(pn)
	if profile then
		if profile:GetDisplayName() == "" then
			-- machine profile
			return true
		else
			return false
		end
	else
		return true
	end

	Warn("SSMusic in/noProfile: wtf going on")
	return true
end

local function LoadProfileText(pn)
	return Def.ActorFrame{
		Name="LoadedProfileMessage";
		InitCommand=function(self)
			self:visible(not noProfile(pn))
			self:playcommand("Set")
		end;
		SetCommand=function(self)
			-- labels labels
			local profile = PROFILEMAN:GetProfile(pn)
			local c = self:GetChildren()
			if profile then
				local songsPlayed = profile:GetNumTotalSongsPlayed()
				c.SongsPlayed:settext( string.format("songs played: %i",songsPlayed) )

				local numToasties = profile:GetNumToasties()
				c.NumToasties:settext( string.format("toasties: %i",numToasties) )
			end
		end;

		LoadFont("_smallcaps 8px")..{
			Name="ProfileName";
			InitCommand=cmd(x,-116;y,-18;shadowlength,1;halign,0;diffuse,PlayerColor(pn);diffusealpha,0;playcommand,"Set";);
			SetCommand=function(self)
				local profile = PROFILEMAN:GetProfile(pn)
				if profile then
					self:settext( profile:GetDisplayName() )
				end
			end;
			OnCommand=cmd(queuecommand,"Anim");
			AnimCommand=cmd(sleep,showTextDelay;linear,fadeInTextTime;diffusealpha,1;sleep,showTextTime;linear,fadeOutTextTime;diffusealpha,0);
		};
		LoadFont("_smallcaps 8px")..{
			Name="SongsPlayed";
			InitCommand=cmd(x,-116;y,-8;shadowlength,1;halign,0;diffusealpha,0;playcommand,"Set";);
			OnCommand=cmd(queuecommand,"Anim");
			AnimCommand=cmd(sleep,showTextDelay;linear,fadeInTextTime;diffusealpha,1;sleep,showTextTime;linear,fadeOutTextTime;diffusealpha,0);
		};
		LoadFont("_smallcaps 8px")..{
			Name="NumToasties";
			InitCommand=cmd(x,-116;y,2;shadowlength,1;halign,0;diffusealpha,0;playcommand,"Set";);
			OnCommand=cmd(queuecommand,"Anim");
			AnimCommand=cmd(sleep,showTextDelay;linear,fadeInTextTime;diffusealpha,1;sleep,showTextTime;linear,fadeOutTextTime;diffusealpha,0);
		};

		--[[
		LoadFont("_smallcaps 8px")..{
			Name="Construction";
			InitCommand=cmd(x,-116;shadowlength,1;halign,0;diffusealpha,0;playcommand,"Set";);
			SetCommand=cmd(settext,THEME:GetString("ScreenSelectMusic","ProfileStatsConstruction"));
			OnCommand=cmd(queuecommand,"Anim");
			AnimCommand=cmd(sleep,showTextDelay;linear,fadeInTextTime;diffusealpha,1;sleep,showTextTime;linear,fadeOutTextTime;diffusealpha,0);
		};
		--]]
	};
end

local function LoadNoProfileText(pn)
	return Def.ActorFrame{
		Name="LoadedNoProfileMessage";
		InitCommand=function(self)
			local noProfileEnv = (pn == PLAYER_1) and "NoProfileMessageP1" or "NoProfileMessageP2"

			if getenv(noProfileEnv) then
				self:visible(false)
				return
			end

			self:visible(noProfile(pn))
		end;
		OnCommand=function(self)
			-- stop displaying the message after the first time.
			local noProfileEnv = (pn == PLAYER_1) and "NoProfileMessageP1" or "NoProfileMessageP2"
			setenv(noProfileEnv,true)
		end;

		LoadFont("_smallcaps 8px")..{
			Name="NoProfileName";
			InitCommand=cmd(x,-116;y,-18;shadowlength,1;halign,0;diffuse,PlayerColor(pn);diffusealpha,0;playcommand,"Set";);
			SetCommand=cmd(settext,THEME:GetString("ScreenSelectMusic","NoProfileText"));
			OnCommand=cmd(queuecommand,"Anim");
			AnimCommand=cmd(sleep,showTextDelay;linear,fadeInTextTime;diffusealpha,1;sleep,showTextTime;linear,fadeOutTextTime;diffusealpha,0);
		};
		LoadFont("_smallcaps 8px")..{
			InitCommand=cmd(x,-116;shadowlength,1;halign,0;diffusealpha,0;playcommand,"Set";);
			SetCommand=cmd(settext,THEME:GetString("ScreenSelectMusic","NoProfileExplain"));
			OnCommand=cmd(queuecommand,"Anim");
			AnimCommand=cmd(sleep,showTextDelay;linear,fadeInTextTime;diffusealpha,1;sleep,showTextTime;linear,fadeOutTextTime;diffusealpha,0);
		};
	};
end

return Def.ActorFrame{
	--[[
	Def.ActorFrame{
		Name="MessageP1";
		InitCommand=cmd(x,SCREEN_CENTER_X-180;y,SCREEN_CENTER_Y+140;player,PLAYER_1);
		LoadActor(THEME:GetPathG("_player","messagebox"))..{
			Name="Frame";
			InitCommand=cmd(cropbottom,1;addy,self:GetHeight(););
			BeginCommand=function(self)
				if noProfile(PLAYER_1) then
					if getenv("NoProfileMessageP1") == true then
						self:visible(false)
						return
					end
				end
			end;
			OnCommand=cmd(playcommand,"AnimIn";);
			AnimInCommand=cmd(linear,frameInTime;cropbottom,0;addy,-self:GetHeight();sleep,showFrameTime;queuecommand,"AnimOut";);
			AnimOutCommand=cmd(linear,frameOutTime;cropbottom,1;addy,self:GetHeight());
		};
		LoadProfileText(PLAYER_1);
		LoadNoProfileText(PLAYER_1);
	};
	Def.ActorFrame{
		Name="MessageP2";
		InitCommand=cmd(x,SCREEN_CENTER_X+180;y,SCREEN_CENTER_Y+140;player,PLAYER_2);
		LoadActor(THEME:GetPathG("_player","messagebox"))..{
			Name="Frame";
			InitCommand=cmd(cropbottom,1;addy,self:GetHeight(););
			BeginCommand=function(self)
				if noProfile(PLAYER_2) then
					if getenv("NoProfileMessageP2") == true then
						self:visible(false)
						return
					end
				end
			end;
			OnCommand=cmd(playcommand,"AnimIn";);
			AnimInCommand=cmd(linear,frameInTime;cropbottom,0;addy,-self:GetHeight();sleep,showFrameTime;queuecommand,"AnimOut";);
			AnimOutCommand=cmd(linear,frameOutTime;cropbottom,1;addy,self:GetHeight());
		};
		LoadProfileText(PLAYER_2);
		LoadNoProfileText(PLAYER_2);
	};
	--]]
};