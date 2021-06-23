RegisterNetEvent('esx_propfix:Use')
AddEventHandler('esx_propfix:Use', function()
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			TriggerEvent('skinchanger:loadSkin', {sex=1})
			Citizen.Wait(3000)
			TriggerEvent('skinchanger:loadSkin', {sex=0})
		elseif skin.sex == 1 then
			TriggerEvent('skinchanger:loadSkin', {sex=0})
			Citizen.Wait(3000)
			TriggerEvent('skinchanger:loadSkin', {sex=1})
		end
	end)
end)