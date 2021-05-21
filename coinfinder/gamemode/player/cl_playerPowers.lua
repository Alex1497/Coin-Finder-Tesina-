local hasJumpPwr = false
local hasSpeedPwr = false
local hasAll = false




hook.Add("Think","PowerCheck",function()
    local client = LocalPlayer()

    if client:GetNWInt("coinNumber") >= 3 and hasSpeedPwr == false then
        hasSpeedPwr = true
        client:ChatPrint("Has desbloqueado SUPER VELOCIDAD")
        net.Start("charStats")
            net.WriteInt(1,16)
        net.SendToServer()
    end

    if client:GetNWInt("coinNumber") >= 6 and hasJumpPwr == false then
        hasJumpPwr = true
        client:ChatPrint("Has desbloqueado SUPER SALTO")
        net.Start("charStats")
            net.WriteInt(2,16)
        net.SendToServer()
    end

    if client:GetNWInt("coinNumber") >= 10 and hasAll == false then
        hasAll = true
        client:ChatPrint("Has recolectado todas las monedas")
        net.Start("charStats")
            net.WriteInt(9,16)
        net.SendToServer()
    end
end)
