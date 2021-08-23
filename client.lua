ESX = nil
local wait = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterCommand("propfix", function()
    local ped = PlayerPedId()
    local hp = GetEntityHealth(ped)
    if hp > 0 then
        if not wait then
            TriggerEvent('skinchanger:getSkin', function(skin)
                wait = true
                Citizen.Wait(50)
                if skin.sex == 0 then
                    TriggerEvent('skinchanger:loadSkin', {sex=1})
                    Citizen.Wait(1000)
                    TriggerEvent('skinchanger:loadSkin', {sex=0})
                elseif skin.sex == 1 then
                    TriggerEvent('skinchanger:loadSkin', {sex=0})
                    Citizen.Wait(1000)
                    TriggerEvent('skinchanger:loadSkin', {sex=1})
                end
                Citizen.Wait(1000)
                SetEntityHealth(ped, hp)
                Citizen.CreateThread(function()
                    Citizen.Wait(10000)
                    wait = false
                end)    
            end)
        else
            ESX.ShowNotification('Nie możesz używac tej komendy tak często')
        end
    else
        ESX.ShowNotification('Nie możesz używac tej komendy na bw')
    end
end)
