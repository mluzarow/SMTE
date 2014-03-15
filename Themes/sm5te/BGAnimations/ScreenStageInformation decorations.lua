local t = LoadFallbackB()

if GAMESTATE:IsCourseMode() then
	-- do some sort of course display
	--t[#t+1] = StandardDecorationFromFile("CourseDisplay","CourseDisplay");

	-- don't forget the player trails
else
	-- hey look we have a song! let's show off some information about it.
	-- banner, cdtitle, {genre, title, artist}, {bpm, length}
	t[#t+1] = StandardDecorationFromFile("SongDisplay","SongDisplay");

	-- don't forget player steps either
	
end

return t