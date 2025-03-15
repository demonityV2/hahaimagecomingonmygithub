local __RecoilHook
__RecoilHook = hookfunction(setmetatable, newcclosure(function(tbl, mt)
    if typeof(mt) == "table" and rawget(mt, "__index") then
        local index = mt.__index
        if getgenv().Full_Auto and type(index) == "table" and not checkcaller() then
            index.FireAction = "auto"
        end
        if getgenv().Fire_Rate and type(index) == "table" and not checkcaller() then
            index.AttackCooldown = -9e9
        end
        if getgenv().NoRecoil and type(index) == "table" and not checkcaller() then
            if rawget(index, "HipRecoil") then
                index.HipRecoil.cameraX, index.HipRecoil.cameraY, index.HipRecoil.push = 0, 0, 0
            end
            if rawget(index, "AimRecoil") then
                index.AimRecoil.cameraX, index.AimRecoil.cameraY, index.AimRecoil.push = 0, 0, 0
            end
        end
        if getgenv().NoSpread and type(index) == "table" and not checkcaller() then
            index.Accuracy = -9e9
        end
        if getgenv().NoReloadAnimation and type(index) == "table" and not checkcaller() then
            index.ReloadTime = -9e9
        end
        if getgenv().InstantEquip and type(index) == "table" and not checkcaller() then
            index.EquipTime = -9e9
        end
    end
    return __RecoilHook(tbl, mt)
end))
