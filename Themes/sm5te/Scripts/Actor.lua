function Actor:SecondaryMask(self)
	--self:clearzbuffer(false);
	self:zwrite(true);
	self:blend('BlendMode_NoEffect');
end

function TextBannerAfterSet(self,param) 
	local Title=self:GetChild("Title")
	local Subtitle=self:GetChild("Subtitle")
	local Artist=self:GetChild("Artist")

	local titleText = Title:GetText()
	local titleLength = string.len(titleText)
	local subtitleText = Subtitle:GetText()
	local subtitleLength = string.len(subtitleText)

	local splitWidth = 30

	if subtitleText == "" then
		Title:y(-10)
		Title:zoom(18/24)
		Title:maxwidth(276*(24/18))

		Subtitle:visible(false)
	elseif (titleLength+subtitleLength+1) <= splitWidth then
		Title:y(-10)
		Title:zoom(18/24)
		Title:maxwidth(276*(24/18))
		Title:settext( string.format("%s %s",titleText,subtitleText) )

		Subtitle:visible(false)
	else
		Title:zoom(16/24)
		Title:y(-12)
		Title:maxwidth(276*(24/16))

		-- subtitle below title
		Subtitle:visible(true)
		Subtitle:zoom(0.45)
		Subtitle:y(1)
	end
end

function JudgmentTransformCommand( self, params )
	self:y( params.bReverse and 12 or -30 )
end

function ComboTransformCommand( self, params )
	local y = params.bReverse and -36 or 0

	--[[
	if params.bCentered then
		if params.bReverse then
			y = y - 15
		else
			y = y + 20
		end
	end
	--]]
	self:y( y )
end

-- oh my god fuuuuuck
function Actor:scale_or_crop_background()
	local gw = self:GetWidth()
	local gh = self:GetHeight()

	local graphicAspect = gw/gh
	local displayAspect = DISPLAY:GetDisplayWidth()/DISPLAY:GetDisplayHeight()

	if graphicAspect == displayAspect then
		-- bga matches the current aspect, we can stretch it.
		self:stretchto( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT )
	else
		if gh < DISPLAY:GetDisplayHeight() then
			-- we have a bg smaller than the display height. we need to scale it up.
			self:scaletofit( SCREEN_CENTER_X-((graphicAspect*SCREEN_HEIGHT)/2),SCREEN_TOP,SCREEN_CENTER_X+((graphicAspect*SCREEN_HEIGHT)/2),SCREEN_HEIGHT)
		else
			self:scaletofit( SCREEN_CENTER_X-(gw/2),SCREEN_TOP,SCREEN_CENTER_X+(gw/2),SCREEN_HEIGHT)
		end
	end
end

function Actor:bad_scale_or_crop_background()
	local gw = self:GetWidth()
	local gh = self:GetHeight()

	local graphicAspect = gw/gh
	local displayAspect = DISPLAY:GetDisplayWidth()/DISPLAY:GetDisplayHeight()

	if graphicAspect == displayAspect then
		-- bga matches the current aspect, we can stretch it.
		self:stretchto( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT )
	else
		-- temp
		self:scaletocover( 0,0,SCREEN_WIDTH,SCREEN_HEIGHT )
		--[[
		-- bga doesn't match the aspect.
		if displayAspect > graphicAspect then
			-- the graphic is smaller than the display aspect ratio
		else
			-- the graphic is bigger than the display aspect ratio; crop me
		end
		--]]
	end
end

function StepInfoYReverseAndScoreFrame(pn)
	local scoreFrame = ThemePrefs.Get("GameplayFooter")
	local usingReverse = GAMESTATE:PlayerIsUsingModifier(pn,"reverse")
	if usingReverse then
		return SCREEN_TOP+58
	else
		if scoreFrame == "Off" then
			return SCREEN_BOTTOM-50
		else
			return SCREEN_BOTTOM-74
		end
	end
end

function OptionsYReverseAndScoreFrame(pn)
	local scoreFrame = ThemePrefs.Get("GameplayFooter")
	local usingReverse = GAMESTATE:PlayerIsUsingModifier(pn,"reverse")
	if usingReverse then
		return SCREEN_TOP+72
	else
		if scoreFrame == "Off" then
			return SCREEN_BOTTOM-62
		else
			return SCREEN_BOTTOM-88
		end
	end
end

function HideScore()
	return ThemePrefs.Get("GameplayFooter") == "Off"
end