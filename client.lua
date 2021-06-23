ESX = nil
local wait = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
  	end
end)

RegisterCommand("propfix", function()
    if not wait then
       TriggerEvent('skinchanger:getSkin', function(skin)
        wait = true
        local hp = GetEntityHealth(GetPlayerPed(-1))
        if skin.sex == 0 then
            TriggerEvent('skinchanger:loadSkin', {sex=1})
            Citizen.Wait(1000)
            TriggerEvent('skinchanger:loadSkin', {sex=0})
        elseif skin.sex == 1 then
            TriggerEvent('skinchanger:loadSkin', {sex=0})
            Citizen.Wait(1000)
            TriggerEvent('skinchanger:loadSkin', {sex=1})
        end
        SetEntityHealth(GetPlayerPed(-1), hp)
        Wait(30000)
        wait = false
        end)
    else
	ESX.ShowNotification('Nie możesz używac tej komendy tak często')
    end
end)
