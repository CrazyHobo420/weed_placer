local VorpCore = {}
local VorpInv

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()

Citizen.CreateThread(function()

    Citizen.Wait(1000)


    VorpInv.RegisterUsableItem("weedsmall", function(data)
        VorpInv.subItem(data.source, "weedsmall", 1)
        TriggerClientEvent("vorp:TipRight", data.source, "You're planting some weed...", 5000)
        TriggerClientEvent("syn:weedsmall", data.source)
    end)
    VorpInv.RegisterUsableItem("weedlarge", function(data)
        VorpInv.subItem(data.source, "weedlarge", 1)
        TriggerClientEvent("vorp:TipRight", data.source, "You're planting some weed...", 5000)
        TriggerClientEvent("syn:weedlarge", data.source)
    end)

end)

RegisterNetEvent("syn:putweedsmall")
AddEventHandler("syn:putweedsmall", function()
    local _source = source
    VorpInv.subItem(_source, "weedsmall", 1)
    TriggerClientEvent("vorp:TipRight", _source, "You're planting some weed...", 5000)
    TriggerClientEvent("syn:weedsmall", _source)
end)

RegisterNetEvent("syn:putweedlarge")
AddEventHandler("syn:putweedlarge", function()
    local _source = source
    VorpInv.subItem(_source, "weedlarge", 1)
    TriggerClientEvent("vorp:TipRight", _source, "You're planting some weed...", 5000)
    TriggerClientEvent("syn:weedlarge", _source)
end)

RegisterNetEvent("syn:additem")
AddEventHandler("syn:additem", function(item)
    local _source = source
    VorpInv.addItem(source, item, 1)
end)

AddEventHandler('syn:additem', function(Item)
        if Item == 'weed' then
          VorpInv.addItem(source, "weed", 0)
          TriggerClientEvent("vorp:TipRight", source, "You've harvested your weed. Have fun!", 5000)
        elseif Item == 'weedlarge' then
            VorpInv.addItem(source, "weedlarge", 0)
            TriggerClientEvent("vorp:TipRight", source, "You've harvested your weed. Have fun!", 5000)
        end
      end)
