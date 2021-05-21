surface.CreateFont("MenuButFont",{
    font = "DermaDefault",
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

local MenuBut




net.Receive("FMenuBut", function()
    InitializeMenuBut()
    if (net.ReadBit() == 0) then
        MenuBut:Hide()
        gui.EnableScreenClicker(false)
    else
        MenuBut:Show()
        gui.EnableScreenClicker(true)
    end
end)

function InitializeMenuBut()
    if !IsValid(MenuBut) then
        MenuBut = vgui.Create("DFrame")
        MenuBut:SetSize(1000,600)
        MenuBut:SetPos(ScrW()/2-500,ScrH()/2 -300)
        MenuBut:SetTitle("Controles")
        MenuBut:SetDraggable(false)
        MenuBut:ShowCloseButton(false)
        MenuBut:SetDeleteOnClose(false)
        MenuBut.Paint = function()

            surface.SetDrawColor(60,60,60,255)
            surface.DrawRect(0,0,MenuBut:GetWide(),MenuBut:GetTall())

            surface.SetDrawColor(40,40,40,255)
            surface.DrawRect(0,24,MenuBut:GetWide(),1)
        end
        local breen_img = vgui.Create("DImage", MenuBut)	-- Add image to Frame
        breen_img:SetPos(MenuBut:GetWide()/2 - (1236/1.25)/2 ,MenuBut:GetTall()/2 - (689/1.25)/2)	-- Move it into frame
        breen_img:SetSize(1236/1.25, 689/1.25)	-- Size it to 150x150
        breen_img:SetImage("materials/controles.png")
    end

end
