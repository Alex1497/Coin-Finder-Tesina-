include("shared.lua")

function ENT:Initialize()
    --Model created by: Anachronistic ALLOS
    --link to steam workshop page: https://steamcommunity.com/sharedfiles/filedetails/?id=2429313802&searchtext=coin
    self.csModel = ClientsideModel("models/star_coin.mdl")
    self.csModel:SetModelScale(1.5 ,0)
    self.csModel:SetColor(Color(255,215,0,255))
    self:DrawShadow(false)
    self:MarkShadowAsDirty()

end

function ENT:Draw()
    local coinAngle =(CurTime() * 90) % 360
    local coinHeight = math.sin(CurTime()* 3) * 5
    self.csModel:SetPos(self:GetPos() + Vector(0,0,coinHeight + 30))
    self.csModel:SetAngles(Angle(0, coinAngle, 0))
end

function ENT:OnRemove()
    self.csModel:Remove()
end
