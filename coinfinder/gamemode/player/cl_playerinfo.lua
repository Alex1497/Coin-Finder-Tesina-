--Based from the video: https://www.youtube.com/watch?v=qxvB-QwMc5M

function HUD()
    local client = LocalPlayer()
    local b_height = 100
    local b_width = 250

    if !client:Alive() then
        return
    end

    draw.RoundedBox(0,0,ScrH() - b_height ,b_width,b_height,Color(50,50,50,230))
    draw.SimpleText("Vida: "..client:Health().." / 100","DermaDefaultBold",10,ScrH()-90,Color (255,255,255),0,0)
    draw.RoundedBox(0,10, ScrH() -75, 100 *2.2, 15, Color(128,128,128,255))
    draw.RoundedBox(0,10, ScrH() - 75, math.Clamp(client:Health(),0,100)*2.2, 15, Color(0,255,0,255))
    draw.SimpleText("Monedas obtenidas: "..client:GetNWInt("coinNumber").." / 10","DermaDefaultBold",10,ScrH()-40,Color (255,255,255),0,0)

end
hook.Add("HUDPaint","TestHud", HUD)

function HideHUD(name)
    for k, v in pairs({"CHudHealth", "CHudBattery","CHudAmmo","CHudSecondaryAmmo"})do
        if name == v then
            return false
        end
    end
end
hook.Add("HUDShouldDraw","HideDefaultHUD",HideHUD)
