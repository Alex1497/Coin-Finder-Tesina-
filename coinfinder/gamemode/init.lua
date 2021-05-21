util.AddNetworkString("charStats")
util.AddNetworkString("end_game")
util.AddNetworkString("coinId")


AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("player/cl_playerinfo.lua")
AddCSLuaFile("player/cl_playerPowers.lua")
AddCSLuaFile("checklist/checklist.lua")
AddCSLuaFile("buttons_menu/menuButt.lua")
AddCSLuaFile("win_panel/cl_win_panel.lua")

include("shared.lua")



local hasJumpPwr = false
local hasSpeedPwr = false
local hasAll = false
local timeStart
local timeFinish
local totalTime
local coin1
local coin2
local coin3
local coin4
local coin5
local coin6
local coin7
local coin8
local coin9
local coin10


net.Receive("charStats",function ()
    local pwrNum = net.ReadInt(16)
    print("Message received "..pwrNum)

    if pwrNum == 2 then
        hasJumpPwr = true
        print("SV JUMP")

    end

    if pwrNum == 1 then
        hasSpeedPwr = true
        print("SV SPEED")

    end

    if pwrNum == 9 then
        hasAll = true
        print("HAS ALL")

    end
end)

function GM:PlayerInitialSpawn(ply)
    ply:SetGravity(0.8)
    ply:SetMaxHealth(100)
    ply:SetRunSpeed(500)
    ply:SetWalkSpeed(300)
    print("SysTime "..SysTime())
    print("CurTime"..CurTime())
    timeStart = CurTime()
    createCoins()
end

function createCoins()
    if game.GetMap() == "gm_construct" then

        --Torre frente al lago a la izquierda de la entrada
        coin1 = ents.Create("moneda",1)
        coin1:SetPos(Vector(-4142.039551, 4910.560547, -31.968750))
        coin1:Spawn()
        coin1:SetCoinID(1)


        --En el fondo del lago
        coin2 = ents.Create("moneda",2)
        coin2:SetPos(Vector(536.566162, 4576.986816, -832.235046))
        coin2:Spawn()
        coin2:SetCoinID(2)


        -- Atrás del edificio frente al lago (Abajo de la pendiente)
        coin3 = ents.Create("moneda",3)
        coin3:SetPos(Vector(-5068.015137, 5356.217773, -31.968750))
        coin3:Spawn()
        coin3:SetCoinID(3)


        --En la torre cuesta arriba en frente del número 1
        coin4 = ents.Create("moneda")
        coin4:SetPos(Vector(-2411.092041, -2892.079834, 320.031250))
        coin4:Spawn()
        coin4:SetCoinID(4)


        --Moneda bajo el farol lado derecho
        coin5 = ents.Create("moneda")
        coin5:SetPos(Vector(1337.749756, -692.434509, -79.968750))
        coin5:Spawn()
        coin5:SetCoinID(5)


        --Moneda bajo el farol lado izquierdo
        coin6 = ents.Create("moneda")
        coin6:SetPos(Vector(1622.402466, -483.329010, -79.96875))
        coin6:Spawn()
        coin6:SetCoinID(6)


        --Edificio blanco a la dercha de la entrada
        coin7 = ents.Create("moneda")
        coin7:SetPos(Vector(819.087036, -1899.694092, -79.968750))
        coin7:Spawn()
        coin7:SetCoinID(7)


        --Plataforma semicicular frente al lago
        coin8 = ents.Create("moneda")
        coin8:SetPos(Vector(677.297058, 4334.896484, 32.031250))
        coin8:Spawn()
        coin8:SetCoinID(8)


        -- Adentro de la bodega junta a la puerta blanca
        coin9 = ents.Create("moneda")
        coin9:SetPos(Vector(-2857.246582, -2506.583740, -191.968750))
        coin9:Spawn()
        coin9:SetCoinID(9)


        -- A lado de la escalera izquierda en la parte más baja de la bodega
        local coin10 = ents.Create("moneda")
        coin10:SetPos(Vector(-2656.812744, -875.565308, -447.968750))
        coin10:Spawn()
        coin10:SetCoinID(10)


    end

    if game.GetMap() == "gm_rudmerge" then

        --Segundo piso motel
        coin1 = ents.Create("moneda")
        coin1:SetPos(Vector(-4228.926270, 9347.230469, 360.031250))
        coin1:SetVar("coinID", 1)
        coin1:Spawn()
        coin1:SetCoinID(1)

        --Muelle de madera
        coin2 = ents.Create("moneda")
        coin2:SetPos(Vector(-13149.119141, 5598.288574, 146.419495))
        coin2:SetVar("coinID", 2)
        coin2:Spawn()
        coin2:SetCoinID(2)

        --Rueda de la fortuna
        coin3 = ents.Create("moneda")
        coin3:SetPos(Vector(-4509.660645, -8088.455078, 160.041077))
        coin3:SetVar("coinID", 3)
        coin3:Spawn()
        coin3:SetCoinID(3)

        --Detrás de la caseta del muelle junto a la rueda de la fortuna
        coin4 = ents.Create("moneda")
        coin4:SetPos(Vector(-12014.628906, -9469.391602, 164.031250))
        coin4:SetVar("coinID", 4)
        coin4:Spawn()
        coin4:SetCoinID(4)

        --Frente a la tienda de hamburguesas
        coin5 = ents.Create("moneda")
        coin5:SetPos(Vector(3516.148193, 10953.698242, 160.031250))
        coin5:SetVar("coinID", 5)
        coin5:Spawn()
        coin5:SetCoinID(5)

        --Frente a la gallina gigante
        coin6 = ents.Create("moneda")
        coin6:SetPos(Vector(10198.996094, 7149.035156, 160.031250))
        coin6:SetVar("coinID", 6)
        coin6:Spawn()
        coin6:SetCoinID(6)

        --Arriba del trecer contenedor que tienen escalera
        coin7 = ents.Create("moneda")
        coin7:SetPos(Vector(11643.012695, -5152.912598, 1445.031250))
        coin7:SetVar("coinID", 7)
        coin7:Spawn()
        coin7:SetCoinID(7)

        --Arriba de la torre de York State Airlines
        coin8 = ents.Create("moneda")
        coin8:SetPos(Vector( 8174.473633, -6707.898926, 1171.261230))
        coin8:SetVar("coinID", 8)
        coin8:Spawn()
        coin8:SetCoinID(8)

        -- Sobre 1 de los cuatro contenedores frente a la iglesia
        coin9 = ents.Create("moneda")
        coin9:SetPos(Vector(-1126.525513, 6843.012207, 1345.027222))
        coin9:SetVar("coinID", 9)
        coin9:Spawn()
        coin9:SetCoinID(9)

        -- Sobre Odd Tod's Market
        coin10 = ents.Create("moneda")
        coin10:SetPos(Vector(-7788.332520, 10258.251953, 523.031250))
        coin10:SetVar("coinID", 10)
        coin10:Spawn()
        coin10:SetCoinID(10)
    end

    if game.GetMap() == "gm_bigcity  " then

    end

end

util.AddNetworkString("open_win_panel")
function GM:PlayerPostThink(ply)

    if hasJumpPwr == true then
        hasJumpPwr = false
        ply:SetJumpPower(1000)
        ply:SetGravity(.6)
        ply:GodEnable()
    end

    if hasSpeedPwr == true then
        hasSpeedPwr = false
        ply:SetRunSpeed(1000)
        ply:SetWalkSpeed(700)
    end

    if hasAll == true then
        hasAll = false
        local timeStr = getTotalTime()
        net.Start("open_win_panel")
            net.WriteString(timeStr)
        net.Broadcast()

    end

end

function getTotalTime()
    timeFinish =CurTime()
    print("SysTime "..SysTime())
    print("CurTime"..CurTime())
    totalTime = timeFinish - timeStart
    local sec = math.floor(totalTime)
    local min = 0
    local hours = 0
    while (sec >= 60) do
        min = min + 1
        sec = sec - 60
    end
    while (min >= 60) do
        hours = hours + 1
        min = min - 60
    end

    if sec < 10 then
        sec = "0"..sec
    end
    if min < 10 then
        min = "0"..min
    end

    if hours < 10 then
        hours = "0"..hours
    end
    return(hours..":"..min..":"..sec)

end

local openC = false
local openM = false

util.AddNetworkString("FChecklist")
function GM:ShowSpare2(ply)
    if openC == false then
        openC = true

    else
        openC = false
    end
    net.Start("FChecklist")
        net.WriteBit(openC)
    net.Broadcast()
end

util.AddNetworkString("FMenuBut")
function GM:ShowSpare1(ply)
    if openM == false then
        openM = true
    else
        openM = false
    end
    net.Start("FMenuBut")
        net.WriteBit(openM)
    net.Broadcast()
end
