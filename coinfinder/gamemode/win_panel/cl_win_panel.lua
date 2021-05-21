surface.CreateFont("WinPanelFont",{
    font = "DermaDefaultBold",
    size = 70,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = false,
    additive = false,
    outline = false,
})

surface.CreateFont("WinPanelFont2",{
    font = "DermaDefaultBold",
    size = 30,
    weight = 500,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = false,
    symbol = false,
    rotary = false,
    shadow = false,
    additive = false,
    outline = false,
})

net.Receive("open_win_panel", function()
    local timeStr = net.ReadString()
    local panel = vgui.Create("DFrame")
    panel:SetSize(ScrW(),ScrH())
    panel:Center()
    panel:SetVisible(true)
    panel:ShowCloseButton(false)
    panel:SetDraggable(false)
    panel:SetTitle("")
    panel.Paint = function(s,w,h)
        draw.RoundedBox(0,0,0,w,h,Color(0,0,0,255))
        draw.DrawText("¡¡¡Felicidades has ganado!!!","WinPanelFont", panel:GetWide()/2 ,25, Color(255,255,255),1)
        draw.DrawText("Tu tiempo fue de: "..timeStr, "WinPanelFont2", panel:GetWide()/2 ,200, Color(255,255,255),1)
    end
    panel:MakePopup()
    local closeButton = vgui.Create("DButton",panel)
    closeButton:SetSize(200,75)
    closeButton:SetPos(ScrW()/2 - 100,ScrH()/2-(75/2))
    closeButton:SetText("Cerrar")
    closeButton.DoClick = function()
        panel:Hide()
    end


end)
