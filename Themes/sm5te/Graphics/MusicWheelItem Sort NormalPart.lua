local function SortText(s)
	return THEME:GetString("MusicWheel",s.."Text")
end

local SortTextToGraphic = {
	[SortText("Preferred")] = "Preferred",
	[SortText("Group")] = "Group",
	[SortText("Title")] = "Title",
	[SortText("Bpm")] = "BPM",
	[SortText("Popularity")] = "PlayerBest",
	["Top Grades"] = "TopGrades",
	["Artist"] = "Artist",
	[SortText("EasyMeter")] = "Easy",
	[SortText("MediumMeter")] = "Medium",
	[SortText("HardMeter")] = "Hard",
	[SortText("ChallengeMeter")] = "Expert",
	[SortText("Genre")] = "Genre",
	[SortText("Length")] = "Length",
	[SortText("Recent")] = "Recent",
}

return Def.ActorFrame{
	Def.Quad{
		Name="Fallback";
		InitCommand=cmd(x,150;halign,1;zoomto,102,32;diffusecolor,color("0,0,0,1"));
	};

	Def.Banner{
		InitCommand=cmd(x,98;);
		SetMessageCommand=function(self,param)
			if param.Label then
				if param.Label ~= "" then
					local gfx = SortTextToGraphic[param.Label]
					self:Load(THEME:GetPathG("_sort","banners/"..gfx))
				end
			end
		end;
	};

	LoadActor(THEME:GetPathG("_section collapsed","base"));
	Def.Quad{
		Name="Border";
		InitCommand=cmd(zoomto,300,2;diffuse,color("#666666");valign,1;y,20);
	};
};