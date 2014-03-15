function InitGameEnvs()
	-- used for disabling the no profile message from appearing multiple times
	-- in a single session (since that will get annoying.)
	setenv("NoProfileMessageP1",false)
	setenv("NoProfileMessageP2",false)
end

local function OptionNameString(str)
	return THEME:GetString('OptionNames',str)
end

local Prefs =
{
	AutoSetStyle =
	{
		Default = false,
		Choices = { OptionNameString('Off'), OptionNameString('On') },
		Values = { false, true }
	},
	GameplayFooter =
	{
		Default = "On",
		Choices = { OptionNameString('On'), OptionNameString('ScoreOnly'), OptionNameString('Off') },
		Values = { "On", "ScoreOnly", "Off" }
	}
}
ThemePrefs.InitAll(Prefs)

-- since these prefs are per-player, I can't use the new ThemePrefs system;
-- it doesn't (yet) have support for profile-specific preferences.
local function ScreenFilterChoices()
	return { "Off", "25%", "50%", "75%", "100%" }
end
local DefaultScreenFilterPercent = 0.0 -- don't show

PlayerPrefs = {
	ScreenFilterRow = {
		Name="ScreenFilter",
		LayoutType = "ShowAllInRow",
		SelectType = "SelectOne",
		OneChoiceForAllPlayers = false,
		ExportOnChange = false,
		Choices = ScreenFilterChoices(),
		LoadSelections = function(self,list,pn)
			local ut = GetUserTable(pn)
			if ut then
				if not ut.Global then ut.Global = {} end
				if ut.Global.ScreenFilter then
					local val = tonumber(ut.Global.ScreenFilter)
					if     val == 0.00 then list[1] = true
					elseif val == 0.25 then list[2] = true
					elseif val == 0.50 then list[3] = true
					elseif val == 0.75 then list[4] = true
					elseif val == 1.00 then list[5] = true
					end
				else
					-- no value, default to off.
					list[1] = true
					ut.Global.ScreenFilter = 0
				end
			else -- no usertable, check for envs
				local envName = "ScreenFilter"..pname(pn)
				if getenv(envName) then
					local val = getenv(envName)
					if     val == 0.00 then list[1] = true
					elseif val == 0.25 then list[2] = true
					elseif val == 0.50 then list[3] = true
					elseif val == 0.75 then list[4] = true
					elseif val == 1.00 then list[5] = true
					end
				else
					-- no env set
					list[1] = true
					setenv(envName,0)
				end
			end
		end,
		SaveSelections = function(self,list,pn)
			local val
			if     list[1] then val = 000
			elseif list[2] then val = 0.25
			elseif list[3] then val = 0.50
			elseif list[4] then val = 0.75
			elseif list[5] then val = 1.00
			end

			local ut = GetUserTable(pn)
			if ut then ut.Global.ScreenFilter = val
			else -- no usertable, set env
				local envName = "ScreenFilter"..pname(pn)
				local val
				if     list[1] then val = 000
				elseif list[2] then val = 0.25
				elseif list[3] then val = 0.50
				elseif list[4] then val = 0.75
				elseif list[5] then val = 1.00
				end
				setenv(envName,val)
			end
		end,
	},
}

function ScreenFilterOptionRow()
	local t = PlayerPrefs.ScreenFilterRow
	setmetatable(t,t)
	return t
end