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
			wait = true
            local model = GetEntityModel(PlayerPedId())
			while not HasModelLoaded(model) do
				RequestModel(model)
				Citizen.Wait(0)
			end
			SetPlayerModel(PlayerId(), model)
			SetPedDefaultComponentVariation(ped)
			TriggerEvent('skinchanger:getSkin', function(result)
				TriggerEvent('skinchanger:loadSkin', result)
				Citizen.Wait(50)
				SetEntityHealth(ped, hp)
			end)
			Citizen.CreateThread(function()
				Citizen.Wait(10000)
				wait = false
			end)    
        else
            ESX.ShowNotification('Nie możesz używac tej komendy tak często')
        end
    else
        ESX.ShowNotification('Nie możesz używac tej komendy na bw')
    end
end)
