surface.CreateFont("ChecklistFont",{
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

local Checklist

local checkbox1
local checkbox2
local checkbox3
local checkbox4
local checkbox5
local checkbox6
local checkbox7
local checkbox8
local checkbox9
local checkbox10



local ischeckbox = false
local ischeckbox1 = false
local ischeckbox2 = false
local ischeckbox3 = false
local ischeckbox4 = false
local ischeckbox5 = false
local ischeckbox6 = false
local ischeckbox7 = false
local ischeckbox8 = false
local ischeckbox9 = false
local ischeckbox10 = false

net.Receive("coinId", function()
    local coin_id = net.ReadInt(16)

    if coin_id == 1 then
        ischeckbox1 = true
    end

    if coin_id == 2 then
        ischeckbox2 = true
    end

    if coin_id == 3 then
        ischeckbox3 = true
    end

    if coin_id == 4 then
        ischeckbox4 = true
    end

    if coin_id == 5 then
        ischeckbox5 = true
    end

    if coin_id == 6 then
        ischeckbox6 = true
    end

    if coin_id == 7 then
        ischeckbox7 = true
    end

    if coin_id == 8 then
        ischeckbox8 = true
    end

    if coin_id == 9 then
        ischeckbox9 = true
    end

    if coin_id == 10 then
        ischeckbox10 = true
    end
end)

net.Receive("FChecklist", function()
    InitializeChecklist()
    if (net.ReadBit() == 0) then
        Checklist:Hide()
        gui.EnableScreenClicker(false)
        removeCheckboxes()
    else
        Checklist:Show()
        gui.EnableScreenClicker(true)
        addCheckboxes(Checklist)
    end
end)

function InitializeChecklist()
    if !IsValid(Checklist) then
        Checklist = vgui.Create("DFrame")
        Checklist:SetSize(750,500)
        Checklist:SetPos(ScrW()/2-325,ScrH()/2 -250)
        Checklist:SetTitle("")
        Checklist:SetDraggable(false)
        Checklist:ShowCloseButton(false)
        Checklist:SetDeleteOnClose(false)
        Checklist.Paint = function()

            surface.SetDrawColor(60,60,60,255)
            surface.DrawRect(0,0,Checklist:GetWide(),Checklist:GetTall())

            surface.SetDrawColor(40,40,40,255)
            surface.DrawRect(0,24,Checklist:GetWide(),1)
            draw.DrawText("Lista de monedas", "ChecklistFont", Checklist:GetWide()/2 ,25, Color(255,255,255),1)
        end
    end

end


function addCheckboxes(Checklist)


    checkbox1 = Checklist:Add("DCheckBoxLabel")
    checkbox1:SetValue(ischeckbox1)
    checkbox1:SetEnabled(false)
    checkbox1:SetPos( 25, 80 )
    if game.GetMap() == "gm_rudmerge" then
        checkbox1:SetText( "Moneda 1: Segundo piso motel" )
    elseif game.GetMap() == "gm_construct" then
        checkbox1:SetText( "Moneda 1: En la torre frente al lago a la izquierda de la entrada" )
    else
        checkbox1:SetText( "" )
    end
    --[[checkbox1.OnChange = function()
        if ischeckbox1 == false then
            ischeckbox1 = true
        else
            ischeckbox1 = false
        end
    end]]--


    checkbox2 = Checklist:Add("DCheckBoxLabel")
    checkbox2:SetValue(ischeckbox2)
    checkbox2:SetPos( 25, 105 )
    checkbox2:SetEnabled(false)
    if game.GetMap() == "gm_rudmerge" then
        checkbox2:SetText( "Moneda 2: En el muelle de madera" )
    elseif game.GetMap() == "gm_construct" then
        checkbox2:SetText( "Moneda 2: En el fondo del lago" )
    else
        checkbox2:SetText("")
    end


    checkbox3 = Checklist:Add("DCheckBoxLabel")
    if ischeckbox3 == true then
        checkbox3:SetValue(true)
    else
        checkbox3:SetValue(false)
    end
    checkbox3:SetPos( 25, 130 )
    checkbox3:SetEnabled(false)
    if game.GetMap() == "gm_rudmerge" then
        checkbox3:SetText( "Moneda 3: Frente a la rueda de la fortuna" )
    elseif game.GetMap() == "gm_construct" then
        checkbox3:SetText( "Moneda 3: Atrás del edificio frente al lago (Abajo de la pendiente)" )
    else
        checkbox3:SetText( "" )
    end



    checkbox4 = Checklist:Add("DCheckBoxLabel")
    checkbox4:SetValue(ischeckbox4)
    checkbox4:SetPos( 25, 155 )
    checkbox4:SetEnabled(false)

    if game.GetMap() == "gm_rudmerge" then
        checkbox4:SetText( "Moneda 4: Detrás de la caseta del muelle junto a la rueda de la fortuna" )
    elseif game.GetMap() == "gm_construct" then
        checkbox4:SetText( "Moneda 4: En la torre cuesta arriba en frente del número 1" )
    else
        checkbox4:SetText( "" )
    end


    checkbox5 = Checklist:Add("DCheckBoxLabel")
    checkbox5:SetValue(ischeckbox5)
    checkbox5:SetPos( 25, 180 )
    checkbox5:SetEnabled(false)

    if game.GetMap() == "gm_rudmerge" then
        checkbox5:SetText( "Moneda 5: En frente a la tienda de hamburguesas" )
    elseif game.GetMap() == "gm_construct" then
        checkbox5:SetText( "Moneda 5: Bajo el farol lado derecho")
    else
        checkbox5:SetText( "" )
    end


    checkbox6 = Checklist:Add("DCheckBoxLabel")
    checkbox6:SetValue(ischeckbox6)
    checkbox6:SetPos( 25, 205 )
    checkbox6:SetEnabled(false)

    if game.GetMap() == "gm_rudmerge" then
        checkbox6:SetText( "Moneda 6: En frente de la gallina gigante" )
    elseif game.GetMap() == "gm_construct" then
        checkbox6:SetText( "Moneda 6: Abajo el farol lado izquierdo")
    else
        checkbox6:SetText( "" )
    end


    checkbox7 = Checklist:Add("DCheckBoxLabel")
    checkbox7:SetValue(ischeckbox7)
    checkbox7:SetPos( 25, 230 )
    checkbox7:SetEnabled(false)
    if game.GetMap() == "gm_rudmerge" then
        checkbox7:SetText( "Moneda 7: Arriba de los 3 contenedores blancos" )
    elseif game.GetMap() == "gm_construct" then
        checkbox7:SetText( "Moneda 7: Edificio blanco a la dercha de la entrada")
    else
        checkbox7:SetText( "" )
    end


    checkbox8 = Checklist:Add("DCheckBoxLabel")
    if ischeckbox8 == true then
        checkbox8:SetValue(true)
    else
        checkbox8:SetValue(false)
    end
    checkbox8:SetPos( 25, 255 )
    checkbox8:SetEnabled(false)

    if game.GetMap() == "gm_rudmerge" then
        checkbox8:SetText( "Moneda 8: Arriba de la torre de York State Airlines" )
    elseif game.GetMap() == "gm_construct" then
        checkbox8:SetText( "Moneda 8: Plataforma semicicular frente al lago")
    else
        checkbox8:SetText( "" )
    end

    checkbox9 = Checklist:Add("DCheckBoxLabel")
    if ischeckbox9 == true then
        checkbox9:SetValue(true)
    else
        checkbox9:SetValue(false)
    end
    checkbox9:SetPos( 25, 280 )
    checkbox9:SetEnabled(false)
    if game.GetMap() == "gm_rudmerge" then
        checkbox9:SetText("Moneda 9: Sobre 1 de los cuatro contenedores frente a la iglesia")
    elseif game.GetMap() == "gm_construct" then
        checkbox9:SetText( "Moneda 9: Adentro de la bodega junta a la puerta blanca")
    else
        checkbox9:SetText( "" )
    end


    checkbox10 = Checklist:Add("DCheckBoxLabel")
    if ischeckbox10 == true then
        checkbox10:SetValue(true)
    else
        checkbox10:SetValue(false)
    end
    checkbox10:SetPos( 25, 305)
    checkbox10:SetEnabled(false)
    if game.GetMap() == "gm_rudmerge" then
        checkbox10:SetText("Moneda 10: Sobre Odd Tod's Market")
    elseif game.GetMap() == "gm_construct" then
        checkbox10:SetText( "Moneda 10: A lado de la escalera izquierda en la parte más baja de la bodega")
    else
        checkbox10:SetText( "" )
    end


end


function removeCheckboxes()
    checkbox1:Remove()
    checkbox2:Remove()
    checkbox3:Remove()
    checkbox4:Remove()
    checkbox5:Remove()
    checkbox6:Remove()
    checkbox7:Remove()
    checkbox8:Remove()
    checkbox9:Remove()
    checkbox10:Remove()

end
