AddCSLuaFile()
AddCSLuaFile("jailrelease/sh/jail_config.lua")

print("{ 		KW - LOADING - START 		}")
function kwJailReleaseLoad( fdir )
	local fl,dc = file.Find( fdir.."*", "LUA" )
	for _,file in ipairs( fl ) do
		if string.match( file, ".lua" ) then
			if SERVER then AddCSLuaFile( fdir..file ) end
			include( fdir..file )
            print("	  Including: ",file)
		end
	end
	for _,dir in ipairs( dc ) do
		kwJailReleaseLoad( fdir..dir.."/" )
	end
end
kwJailReleaseLoad( "jailrelease/" )
print("{ 		KW - LOADING - END 		}")