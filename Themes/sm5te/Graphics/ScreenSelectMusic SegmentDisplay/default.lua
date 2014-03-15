local debugMe = false

-- player segment display: segment display per player
local player = ...
assert(player,"PlayerSegmentDisplay needs player")

local iconPath = THEME:GetPathG("ScreenSelectMusic","SegmentDisplay/_timingicons")

local showCmd = cmd(stoptweening;accelerate,0.125;diffusealpha,1)
local hideCmd = cmd(stoptweening;accelerate,0.125;diffusealpha,0)

local SegmentTypes = {
	Stops	=	{ Frame = 0, xPos = 0 },
	Warps	=	{ Frame = 2, xPos = 16 },
	Delays	=	{ Frame = 1, xPos = 32 },
	Attacks	=	{ Frame = 6, xPos = 96 },
	Scrolls	=	{ Frame = 3, xPos = 48 },
	Speeds	=	{ Frame = 4, xPos = 64 },
	Fakes	=	{ Frame = 5, xPos = 80 },
};

local function IconCommand(segType)
	local frame = SegmentTypes[segType].Frame
	local xPos = SegmentTypes[segType].xPos
	return cmd(animate,false;x,xPos+8;setstate,frame;diffusealpha,0)
end

local t = Def.ActorFrame{
	BeginCommand=cmd(playcommand,"SetIcons";playcommand,"SetAttacksIconMessage");
	--OffCommand=cmd( RunCommandsOnChildren,cmd(playcommand,"Hide") );

	SetIconsCommand=function(self)
		local stops = self:GetChild("StopsIcon")
		local delays = self:GetChild("DelaysIcon")
		local warps = self:GetChild("WarpsIcon")
		local scrolls = self:GetChild("ScrollsIcon")
		local speeds = self:GetChild("SpeedsIcon")
		local fakes = self:GetChild("FakesIcon")

		-- hax
		MESSAGEMAN:Broadcast("SetAttacksIcon",{Player = player})

		local song = GAMESTATE:GetCurrentSong()
		if song then
			local steps = GAMESTATE:GetCurrentSteps(player)
			if steps then
				local timing = steps:GetTimingData()

				if debugMe then
					warps:playcommand("Show")
					stops:playcommand("Show")
					delays:playcommand("Show")
					scrolls:playcommand("Show")
					speeds:playcommand("Show")
					fakes:playcommand("Show")
				else
					warps:playcommand( timing:HasWarps() and "Show" or "Hide" )
					stops:playcommand( timing:HasStops() and "Show" or "Hide")
					delays:playcommand( timing:HasDelays() and "Show" or "Hide")
					scrolls:playcommand( timing:HasScrollChanges() and "Show" or "Hide")
					speeds:playcommand( timing:HasSpeedChanges() and "Show" or "Hide")
					fakes:playcommand( timing:HasFakes() and "Show" or "Hide")
				end
			else
				warps:playcommand("Hide")
				stops:playcommand("Hide")
				delays:playcommand("Hide")
				scrolls:playcommand("Hide")
				speeds:playcommand("Hide")
				fakes:playcommand("Hide")
			end
		else
			warps:playcommand("Hide")
			stops:playcommand("Hide")
			delays:playcommand("Hide")
			scrolls:playcommand("Hide")
			speeds:playcommand("Hide")
			fakes:playcommand("Hide")
		end
	end;
	SetAttacksIconMessageCommand=function(self,param)
		if param.Player == player then
			local attacks = self:GetChild("AttacksIcon")
			local song = GAMESTATE:GetCurrentSong()
			if song then
				local steps = GAMESTATE:GetCurrentSteps(param.Player)
				if steps then
					if debugMe then
						attacks:playcommand("Show")
					else
						attacks:playcommand(steps:HasAttacks() and "Show" or "Hide")
					end
				else
					attacks:playcommand("Hide")
				end
			else
				attacks:playcommand("Hide")
			end
		end
	end;

	LoadActor("_plate")..{
		InitCommand=cmd(x,56;);
	};

	LoadActor(iconPath)..{
		Name="WarpsIcon";
		InitCommand=IconCommand("Warps");
		ShowCommand=showCmd;
		HideCommand=hideCmd;
	};
	LoadActor(iconPath)..{
		Name="StopsIcon";
		InitCommand=IconCommand("Stops");
		ShowCommand=showCmd;
		HideCommand=hideCmd;
	};
	LoadActor(iconPath)..{
		Name="DelaysIcon";
		InitCommand=IconCommand("Delays");
		ShowCommand=showCmd;
		HideCommand=hideCmd;
	};
	LoadActor(iconPath)..{
		Name="AttacksIcon";
		InitCommand=IconCommand("Attacks");
		ShowCommand=showCmd;
		HideCommand=hideCmd;
	};
	LoadActor(iconPath)..{
		Name="ScrollsIcon";
		InitCommand=IconCommand("Scrolls");
		ShowCommand=showCmd;
		HideCommand=hideCmd;
	};
	LoadActor(iconPath)..{
		Name="SpeedsIcon";
		InitCommand=IconCommand("Speeds");
		ShowCommand=showCmd;
		HideCommand=hideCmd;
	};
	LoadActor(iconPath)..{
		Name="FakesIcon";
		InitCommand=IconCommand("Fakes");
		ShowCommand=showCmd;
		HideCommand=hideCmd;
	};
	CurrentSongChangedMessageCommand=cmd(playcommand,"SetIcons";);
	CurrentStepsP1ChangedMessageCommand=function(self) self:playcommand("SetIcons") if player == PLAYER_1 then MESSAGEMAN:Broadcast("SetAttacksIcon",{Player = PLAYER_1}) end end;
	CurrentStepsP2ChangedMessageCommand=function(self) self:playcommand("SetIcons") if player == PLAYER_2 then MESSAGEMAN:Broadcast("SetAttacksIcon",{Player = PLAYER_2}) end end;
};

return t;