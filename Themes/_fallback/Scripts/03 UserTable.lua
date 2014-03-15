-- UserTable helper, by freem
function GetUserTable(pn)
	local profile = PROFILEMAN:GetProfile(pn)
	if profile and profile:GetUserTable() then return profile:GetUserTable() end
	return nil
end

function GetUserTableGlobal(pn,gName)
	local ut = GetUserTable(pn)
	if not ut then return nil end
	if not ut.Global then return nil end
	return ut.Global[gName]
end

-- alias fun, but might fuck with others.
UserTable = {}
UserTable.Get = GetUserTable
UserTable.GetGlobal = GetUserTableGlobal

-- copyfreem 2000
-- copyright 2012 freemco
-- do not use this code without written permission from freemco.