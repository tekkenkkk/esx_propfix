ESX = nil
local wait = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
  	end
end)

RegisterCommand("propfix", function()
    if not wait and GetEntityHealth(GetPlayerPed(-1)) > 0 then
       TriggerEvent('skinchanger:getSkin', function(skin)
        wait = true
        Citizen.Wait(50)
        local health = GetEntityHealth(GetPlayerPed(-1))
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
        SetEntityHealth(GetPlayerPed(-1), health)
        Citizen.Wait(30000)
        wait = false
        end)
    else
	    ESX.ShowNotification('Nie możesz używac tej komendy tak często')
    end
end)
