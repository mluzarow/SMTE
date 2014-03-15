titleMenuItems = {
	GameStart	= color("0,0.95,0,1"),
	GameType	= color("1,0.8,0,1"),
	Data		= color("#FF0090"),
	Options		= color("0,0.8,1,1"),
	Exit		= color("1,0,0,1"),
}

local DefaultPlayerColors = {
	PlayerNumber_P1 = color("#FF7700"),
	PlayerNumber_P2 = color("#0088FF"),
}
-- todo: allow for profiles to have custom colors.
function PlayerColor(pn)
	return DefaultPlayerColors[pn] or color("#FFFFFF")
end

CustomDifficultyColors = {
	Beginner	= color("#32fff8"),			-- light cyan
	Easy		= color("#2cff00"),			-- green
	Medium		= color("#fee600"),			-- yellow
	Hard		= color("#ff2f39"),			-- red
	Challenge	= color("#66AAFF"),			-- blue
	Edit		= color("0.8,0.8,0.8,1"),	-- gray
	Couple		= color("#ed0972"),			-- hot pink
	Routine		= color("#ff9a00"),			-- orange
}
CustomDifficultyColors["Expert"] = CustomDifficultyColors["Challenge"]
--
CustomDifficultyColors["Crazy"] = CustomDifficultyColors["Hard"]
CustomDifficultyColors["Freestyle"] = CustomDifficultyColors["Easy"]
CustomDifficultyColors["Nightmare"] = CustomDifficultyColors["Challenge"]
CustomDifficultyColors["HalfDouble"] = CustomDifficultyColors["Medium"]

function CustomDifficultyToColor( sCustomDifficulty ) 
	return CustomDifficultyColors[sCustomDifficulty]
end

-- radar category colors
RadarCategoryColors = {
	TapsAndHolds	= { Main = color("#FFFFFF"), Dark = color("#888888"), Shadow = color("#444444") },
	Jumps			= { Main = color("#FFAA00"), Dark = color("#883300"), Shadow = color("#441800") },
	Holds			= { Main = color("#88CCFF"), Dark = color("#224488"), Shadow = color("#112244") },
	Rolls			= { Main = color("#00FF00"), Dark = color("#008800"), Shadow = color("#004400") },
	Hands			= { Main = color("#FFEE00"), Dark = color("#887700"), Shadow = color("#443300") },
	Mines			= { Main = color("#FF0000"), Dark = color("#880000"), Shadow = color("#440000") },
	Lifts			= { Main = color("#FF00AA"), Dark = color("#880055"), Shadow = color("#440033") },
	Fakes			= { Main = color("#CCCCCC"), Dark = color("#666666"), Shadow = color("#333333") },
	------------------
	Stream			= { Main = color("#FFAA00"), Dark = color("#885500"), Shadow = color("#442200") },
	Voltage			= { Main = color("#FFFF00"), Dark = color("#888800"), Shadow = color("#444400") },
	Air				= { Main = color("#44DDFF"), Dark = color("#226688"), Shadow = color("#112244") },
	Freeze			= { Main = color("#0066FF"), Dark = color("#002288"), Shadow = color("#001244") },
	Chaos			= { Main = color("#00FF00"), Dark = color("#008800"), Shadow = color("#004400") }
}

SortOrderColors = {
	ModeMenu		= color("#FFFFFF"),
	Preferred		= color("#FFFFFF"),
	Group			= color("#FFFFFF"),
	Title			= color("#FFFFFF"),
	Artist			= color("#FFFFFF"),
	BPM				= color("#FFFFFF"),
	Genre			= color("#FFFFFF"),
	Length			= color("#FFFFFF"),
	Recent			= color("#FFFFFF"),
	Popularity		= color("#FFFFFF"),
	EasyMeter		= CustomDifficultyColors.Easy,
	MediumMeter		= CustomDifficultyColors.Medium,
	HardMeter		= CustomDifficultyColors.Hard,
	ChallengeMeter	= CustomDifficultyColors.Challenge,
	Invalid			= color("#FFFFFF")
}

JudgeColors = {
	W1			= color("#FFFFC9"),
	W2			= color("#ffcc00"),
	W3			= color("#20cc00"),
	W4			= color("#2070e0"),
	W5			= color("#bf00e5"),
	Miss		= color("#f00000"),
	MaxCombo	= color("#A0F0FA")
}