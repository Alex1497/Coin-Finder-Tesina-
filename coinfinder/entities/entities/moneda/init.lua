

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")


function ENT:Initialize()
    self:SetModel("models/hunter/blocks/cube025x025x025.mdl")
    self:SetModelScale(1.5 ,0)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:SetColor(Color(255,223,0))

    self:GetPhysicsObject():Wake()
    self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
    self:SetTrigger(true)
    self.coinId = 0

end

function ENT:StartTouch(eOtherEnt)
    if eOtherEnt:IsPlayer() then
        eOtherEnt:SetNWInt("coinNumber",eOtherEnt:GetNWInt("coinNumber") + 1)
        eOtherEnt:ChatPrint("You have  picked "..eOtherEnt:GetNWInt("coinNumber").." coins")
        local temp = self.coinId
        print(self.coinId)
        net.Start("coinId")
            net.WriteInt(temp,16)
        net.Broadcast()
        self:Remove()



    end

end

function ENT:SetCoinID(id)
    self.coinId = id
end

function ENT:GetCoinID()
    return self.coinId
end
