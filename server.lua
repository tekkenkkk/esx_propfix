local wait = false

RegisterCommand("propfix", function(source)
    if not wait then
		wait = true
		TriggerClientEvent('esx_propfix:Use', source)
		Wait(30000)
		wait = false
	else
        TriggerClientEvent('esx:showNotification', source, 'Nie możesz używac tej komendy tak często')
	end
end, false)