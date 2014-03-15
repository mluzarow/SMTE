-- unused, incomplete.
local function CreditsBG(pn)
	return Def.Quad{
		InitCommand=function(self)
			self:draworder(-100)
			self:halign(pn == PLAYER_1 and 0 or 1);
			local xOffset = pn == PLAYER_1 and -4 or 4
			self:x(THEME:GetMetric("ScreenSystemLayer","Credits"..PlayerNumberToString(pn).."X")+xOffset)
			self:y(THEME:GetMetric("ScreenSystemLayer","Credits"..PlayerNumberToString(pn).."Y")-6)
			self:zoomto(128,24);
			self:diffusecolor(BoostColor(PlayerColor(pn),0.2))
			self:diffusealpha(0.5)
			if pn == PLAYER_1 then
				self:faderight(1)
			else
				self:fadeleft(1)
			end
		end;
		UpdateVisibleCommand=function(self)
			local screen = SCREENMAN:GetTopScreen();
			local bShow = true;
			if screen then
				local sClass = screen:GetName();
				bShow = THEME:GetMetric( sClass, "ShowCreditDisplay" );
			end

			self:visible( bShow );
		end
	}
end

local function CreditsText( pn )
	local text = Def.ActorFrame{
		LoadFont("_smallcaps 8px")..{
			Name="Label";
			InitCommand=function(self)
				self:halign(pn == PLAYER_1 and 0 or 1);
				self:uppercase(true)
				self:shadowlength(1)
				self:diffusecolor( Brightness(Saturation(PlayerColor(pn),0.25),0.8) )
				self:diffusealpha( 0.725 )
				self:shadowcolor( BoostColor(PlayerColor(pn),0.2) )
				self:x(THEME:GetMetric("ScreenSystemLayer","Credits"..PlayerNumberToString(pn).."X"))
				self:y(THEME:GetMetric("ScreenSystemLayer","Credits"..PlayerNumberToString(pn).."Y")-10)
				self:settext(PlayerNumberToString(pn))
			end;
			SaturateCommand=cmd(sleep,0.02;linear,0.48;diffusecolor,PlayerColor(pn);diffusealpha,0.95);
			DesaturateCommand=cmd(sleep,0.02;linear,0.48;diffusecolor,Brightness(Saturation(PlayerColor(pn),0.25),0.8);diffusealpha,0.95);
			UpdateVisibleCommand=function(self)
				local screen = SCREENMAN:GetTopScreen();
				local bShow = true;
				if screen then
					local sClass = screen:GetName();
					bShow = THEME:GetMetric( sClass, "ShowCreditDisplay" );

					if bShow then
						local screenType = screen:GetScreenType()
						if screenType == "ScreenType_Gameplay" then
							bShow = false
						end
					end
				end

				self:draworder(90)
				self:visible( bShow );
			end;
			-- message handlin' motherfucker
			ScreenChangedMessageCommand=cmd(queuecommand,"UpdateVisible");
			PlayerJoinedMessageCommand=function(self,param)
				if param.Player == pn then
					self:queuecommand("Saturate")
				end
			end;
			PlayerUnjoinedMessageCommand=function(self,param)
				if param.Player == pn then
					self:queuecommand("Desaturate")
				end
			end;
		};
		Def.Sprite{
			Name="MemCard";
			InitCommand=function(self)
				local flip = (pn == PLAYER_1) and 1 or -1
				self:halign(pn == PLAYER_1 and 0 or 1);
				self:x(THEME:GetMetric("ScreenSystemLayer","Credits"..PlayerNumberToString(pn).."X") + (20*flip))
				self:y(THEME:GetMetric("ScreenSystemLayer","Credits"..PlayerNumberToString(pn).."Y")-10)
			end;
			ResetCardDisplayMessageCommand=function(self)
				self:Load( THEME:GetPathG("_credits","memcard/_machine waiting") )
				self:visible(false)
			end;
			SetMemCardSpriteMessageCommand=function(self)
				if not GAMESTATE:IsSideJoined(pn) then
					self:visible(false)
					return
				else
					local profile = PROFILEMAN:GetProfile(pn)
					local state = "_machine ready"
					if profile then
						local memCard = PROFILEMAN:ProfileWasLoadedFromMemoryCard(pn)
						if memCard then
							state = "_usb ready"
						else
							-- xxx: assumption. needs more freems.
							if profile:GetDisplayName() ~= "" then
								state = "_local ready"
							end
						end

						self:visible(true)
						self:Load( THEME:GetPathG("_credits","memcard/"..state) )
					else
						-- no profile
						self:visible(false)
					end
				end
			end;
			UpdateVisibleCommand=function(self)
				local screen = SCREENMAN:GetTopScreen();
				local bShow = true;
				if screen then
					local sClass = screen:GetName();
					bShow = THEME:GetMetric( sClass, "ShowCreditDisplay" );

					if bShow then
						local screenType = screen:GetScreenType()
						if screenType == "ScreenType_Gameplay" then
							bShow = false
						end
					end
				end

				self:draworder(90)
				self:visible( bShow );
			end;
			ScreenChangedMessageCommand=cmd(queuecommand,"UpdateVisible";);
		};

		LoadFont("_smallcaps 8px") .. {
			InitCommand=function(self)
				self:name("Credits" .. PlayerNumberToString(pn))
				ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen");
			end;
			UpdateTextCommand=function(self)
				local str = ScreenSystemLayerHelpers.GetCreditsMessage(pn);
				str = TECreditsMessage(pn,str)
				self:settext(str);
			end;
			UpdateVisibleCommand=function(self)
				local screen = SCREENMAN:GetTopScreen();
				local bShow = true;
				if screen then
					local sClass = screen:GetName();
					bShow = THEME:GetMetric( sClass, "ShowCreditDisplay" );
					-- hack: don't show "No Profile" on juke'm box
					if GAMESTATE:IsDemonstration() and sClass == "ScreenJukebox" then
						bShow = false
					end
				end

				self:draworder(90)
				self:visible( bShow );
			end;
		};
	}
	return text;
end;

local t = Def.ActorFrame{
	-- credits
	--CreditsBG( PLAYER_1 );
	--CreditsBG( PLAYER_2 ); 

	CreditsText( PLAYER_1 );
	CreditsText( PLAYER_2 ); 

	-- system messages
	Def.ActorFrame {
		Def.Quad {
			InitCommand=cmd(zoomtowidth,SCREEN_WIDTH;zoomtoheight,30;horizalign,left;vertalign,top;y,SCREEN_TOP;diffuse,color("0,0,0,0"));
			OnCommand=cmd(finishtweening;diffusealpha,0.85;);
			OffCommand=cmd(sleep,3;linear,0.5;diffusealpha,0;);
		};
		LoadFont("Common","Normal") .. {
			Name="Text";
			InitCommand=cmd(maxwidth,750;horizalign,left;vertalign,top;y,SCREEN_TOP+10;x,SCREEN_LEFT+10;shadowlength,1;diffusealpha,0;);
			OnCommand=cmd(finishtweening;diffusealpha,1;zoom,0.5);
			OffCommand=cmd(sleep,3;linear,0.5;diffusealpha,0;);
		};
		SystemMessageMessageCommand = function(self, params)
			self:GetChild("Text"):settext( params.Message );
			self:playcommand( "On" );
			if params.NoAnimate then
				self:finishtweening();
			end
			self:playcommand( "Off" );
		end;
		HideSystemMessageMessageCommand = cmd(finishtweening);
	};
}

return t;
