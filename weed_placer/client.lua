local town_hash = nil



local status = false

local weedsmall = 0
local weedlarge = 0 



RegisterNetEvent('syn:weedsmall')
AddEventHandler('syn:weedsmall', function()
   

    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 20000, true, false, false, false)
    exports['progressBars']:startUI(10000, "You're planting some weed...")
    Citizen.Wait(10000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, -1.55))
    local prop = CreateObject(GetHashKey("prop_weed_02"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    weedsmall = prop
end)

RegisterNetEvent('syn:weedlarge')
AddEventHandler('syn:weedlarge', function()
    

    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 20000, true, false, false, false)
    exports['progressBars']:startUI(10000, "You're planting some weed...")
    Citizen.Wait(10000)
    ClearPedTasksImmediately(PlayerPedId())
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, -1.55))
    local prop = CreateObject(GetHashKey("prop_weed_01"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    weedlarge = prop
end)

------------------- Commands to remove/disabled prop -------------------
RegisterCommand('dweed', function(source, args, rawCommand)
    if weedsmall ~= 0 then
        --print("There is no more weed.")
    --else
        SetEntityAsMissionEntity(weedsmall)
        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 7000, true, false, false, false)
        TriggerEvent("vorp:TipRight", "Harvesting your weed...", 7000)
        Wait(7000)
        --ClearPedTasksImmediately(PlayerPedId())
        TriggerServerEvent('syn:additem', "weedsmall")
        DeleteEntity(weedsmall)
        weedsmall = 0   
    end
end)

RegisterCommand('dweedlarge', function(source, args, rawCommand)
    if weedlarge ~= 0 then
        --print("There is no more weed.")
    --else
        SetEntityAsMissionEntity(weedlarge)
        TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), 7000, true, false, false, false)
        TriggerEvent("vorp:TipRight", "Harvesting your weed...", 7000)
        Wait(7000)
        --ClearPedTasksImmediately(PlayerPedId())
        TriggerServerEvent('syn:additem', "weedlarge")
        DeleteEntity(weedlarge)
        weedlarge = 0
    end
end, false)
