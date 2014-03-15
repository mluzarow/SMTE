local freemco = {
	"freem",
}

local thanks = {
	"NAKET Coder",
	"Wiz Khalifa",
	"Juicy J",
}

local copyright = {
	"All content is the sole property of their respectful owners."
}

local sections = {
	{ "the freem corporation", freemco },
	{ "Special Thanks", thanks },
	{ "Copyright", copyright },
}

-- To add people or sections modify the above.

local lineOn = cmd(zoom,0.875;strokecolor,color("#444444");shadowcolor,color("#444444");shadowlength,3)
local sectionOn = cmd(diffuse,color("#88DDFF");strokecolor,color("#446688");shadowcolor,color("#446688");shadowlength,3)
local item_padding_start = 4;

local creditScroller = Def.ActorScroller {
	SecondsPerItem = 0.5;
	NumItemsToDraw = 40;
	TransformFunction = function( self, offset, itemIndex, numItems)
		self:y(30*offset)
	end;
	OnCommand = cmd(scrollwithpadding,item_padding_start,15);
}

local function AddLine( text, command )
	local text = Def.ActorFrame{
		LoadFont("Common normal")..{
			Text = text or "";
			OnCommand = command or lineOn;
		}
	}
	table.insert( creditScroller, text )
end

-- Add sections with padding.
for section in ivalues(sections) do
	AddLine( section[1], sectionOn )
	for name in ivalues(section[2]) do
		AddLine( name )
	end
	AddLine()
	AddLine()
end

creditScroller.BeginCommand=function(self)
	local topScreen = SCREENMAN:GetTopScreen()
	if topScreen then
		topScreen:PostScreenMessage( "SM_BeginFadingOut", (creditScroller.SecondsPerItem * (#creditScroller + item_padding_start) + 5) );
	end
end;

return Def.ActorFrame{
	creditScroller..{
		InitCommand=cmd(CenterX;y,SCREEN_BOTTOM-64),
	}
};