-- new in tournament edition: this bullshit.

if not GAMESTATE:IsCourseMode() then
	local song = SongOrCourse()
	if song then
		-- artist hacks
		local artist = song:GetDisplayArtist()

		-- wiz khalifa hack
		if string.find(artist,"Wiz Khalifa") then
			return THEME:GetPathG("_fallback","1")
		end

		-- dragonforce hack
		if string.find(artist,"Dragonforce") then
			return THEME:GetPathG("_fallback","3")
		end

		-- juicy j hack
		if string.find(artist,"Three 6 Mafia") 
		or string.find(artist,"Triple 6 Mafia") 
		or string.find(artist,"Three Six Mafia") 
		or string.find(artist,"Triple Six Mafia") 
		or string.find(artist,"Juicy J")  then
			return THEME:GetPathG("_fallback","5")
		end
	end
end

-- fallback
local numBanners = 8
local randNum = math.random(1,numBanners)
return THEME:GetPathG("_fallback",randNum)