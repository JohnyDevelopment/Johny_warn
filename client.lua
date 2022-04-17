ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1000)
    end
end)
RegisterNetEvent("imago:maszwarna")
AddEventHandler("imago:maszwarna", function(powod, name)
    ESX.Scaleform.ShowFreemodeMessage('~r~Ostrzezenie', 'Otrzymales Ostrzezenie Od: ~y~'..name..'~w~ Z Powodu: ~y~'..powod, 10)
end)