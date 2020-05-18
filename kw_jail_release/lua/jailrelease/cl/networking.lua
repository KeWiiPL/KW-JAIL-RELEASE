if SERVER then return false end
net.Receive("KWJAIL.NOTIFY", function()
    local notify = net.ReadInt(16)
    print(notify)
    if notify == 1 then
        chat.AddText(Color(74, 186, 255),KWJAIL.LANG.SERVER,Color(255, 107, 107)," ",KWJAIL.LANG.NOTARRESTED)
    elseif notify == 2 then
        chat.AddText(Color(74, 186, 255),KWJAIL.LANG.SERVER,Color(255, 107, 107)," ",KWJAIL.LANG.PLYISCOP)
    elseif notify == 3 then
        chat.AddText(Color(74, 186, 255),KWJAIL.LANG.SERVER,Color(255, 107, 107)," ",KWJAIL.LANG.NOMONEY)
    elseif notify == 4 then
        chat.AddText(Color(74, 186, 255),KWJAIL.LANG.SERVER,Color(255, 107, 107)," ",KWJAIL.LANG.FREENOW)
    end
end)