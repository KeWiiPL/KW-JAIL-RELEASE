include("shared.lua")
include("jailrelease/sh/jail_config.lua")

hook.Add("PostDrawOpaqueRenderables", "kwJailReleaseNPCDRAW", function()
	for _, ent in pairs( ents.FindByClass( "kwjailnpc" ) ) do
		if ent:GetPos():Distance(LocalPlayer():GetPos()) < 200 then
            local pos = ent:GetPos() + Vector(0, 0, 1) * math.sin(CurTime() * 2) * 2
            local PlayersAngle = LocalPlayer():GetAngles()
            local ang = Angle( 0, PlayersAngle.y - 180, 0 )

            ang:RotateAroundAxis(ang:Right(), -90)
            ang:RotateAroundAxis(ang:Up(), 90)
	        cam.Start3D2D(pos, ang, 0.2)
			 	draw.SimpleTextOutlined( KWJAIL.LANG.NPCTEXT, "kwJail2", 0, -420, Color( 250, 100, 100 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color( 0, 0, 0, 255 ) )
			    draw.SimpleTextOutlined( KWJAIL.LANG.NPCDESC1.." "..DarkRP.formatMoney(KWJAIL.NPC.COST).." "..KWJAIL.LANG.NPCDESC2, "kwJail1", 0, -400, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color( 0, 0, 0, 255 ) )
	        cam.End3D2D()
	    end
    end
end)