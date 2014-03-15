local t = LoadFallbackB()

table.insert(t,StandardDecorationFromFile("Logo","Logo"))
table.insert(t,StandardDecorationFromFile("VersionInfo","VersionInfo"))
table.insert(t,StandardDecorationFromFile("GameInfo","GameInfo"))

table.insert(t,StandardDecorationFromFile("Company","Company"))
table.insert(t,StandardDecorationFromFile("Copyright","Copyright"))

return t