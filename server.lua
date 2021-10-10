ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.PotrebaItem then

	ESX.RegisterUsableItem(Config.VykradaciItem, function(source)
		TriggerClientEvent('nt-vykradacka:itemused', source)
	end)

	RegisterServerEvent('nt-vykradacka:fail')
	AddEventHandler('nt-vykradacka:fail', function()
		local _source = source
		local xPlayer = ESX.GetPlayerFromId(_source)

		xPlayer.removeInventoryItem(Config.VykradaciItem, 1)
	end)

end

RegisterServerEvent('nt-vykradacka:ReceiveMonies')
AddEventHandler('nt-vykradacka:ReceiveMonies', function(check)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if check == true then
		local amount = math.random(Config.PokladnaMin,Config.PokladnaMax)
		xPlayer.addMoney(amount)
		TriggerClientEvent('mythic_notify:client:DoHudText', source, { type = 'success', text = 'Dokonceno! Obdrzel jsi $' .. amount})
	end
	
end)


RegisterServerEvent('nt-vykradacka:cops', robtype, store)
AddEventHandler('nt-vykradacka:cops', function(robtype, store)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()

	local locationLastRobbed

	local cops = 0
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			cops = cops + 1
		end
	end

	if Config.LokaceObchodu[store] then
		locationLastRobbed = Config.LokaceObchodu[store]
	elseif Config.LokaceSafe[store] then
		locationLastRobbed = Config.LokaceSafe[store]
	elseif Config.VaultLokace[store] then
		locationLastRobbed = Config.VaultLokace[store]
	end

	if robtype == "cashreg" then
		if cops >= Config.Pokladna then
			if (os.time() - locationLastRobbed.lastRobbed) < Config.PokladnaCooldown and locationLastRobbed.lastRobbed ~= 0 then 
				TriggerClientEvent('mythic_notify:client:DoHudText', source, { type = 'error', text = 'Tento obchod uz byl vykraden!'})
			else
				TriggerClientEvent('nt-vykradacka:cashregrob', source)
			end
		else
			TriggerClientEvent('mythic_notify:client:DoHudText', source, { type = 'error', text = 'Nedostatek policajtu!'})
		end

	elseif robtype == "safe" then
		if cops >= Config.Safe then
			if (os.time() - locationLastRobbed.lastRobbed) < Config.SafeCooldown and locationLastRobbed.lastRobbed ~= 0 then 
				TriggerClientEvent('mythic_notify:client:DoHudText', source, { type = 'error', text = 'Tento obchod uz byl vykraden!'})
			else
				TriggerClientEvent('nt-vykradacka:saferob', source)
			end
		else
			TriggerClientEvent('mythic_notify:client:DoHudText', source, { type = 'error', text = 'Nedostatek policajtu!'})
		end

	elseif robtype == "vault" then
		if cops >= Config.Vault then
			if (os.time() - locationLastRobbed.lastRobbed) < Config.VaultCooldown and locationLastRobbed.lastRobbed ~= 0 then 
				TriggerClientEvent('mythic_notify:client:DoHudText', source, { type = 'error', text = 'Tento obchod uz byl vykraden!'})
			else
				TriggerClientEvent('nt-vykradacka:vaultrob', source)
			end
		else
			TriggerClientEvent('mythic_notify:client:DoHudText', source, { type = 'error', text = 'Nedostatek policajtu!'})
		end
	end
end)

RegisterServerEvent('nt-vykradacka:completed', store)
AddEventHandler('nt-vykradacka:completed', function(store)
	local locationRobbed
	if Config.LokaceObchodu[store] then
		locationRobbed = Config.LokaceObchodu[store]
		locationRobbed.lastRobbed = os.time()
	elseif Config.LokaceSafe[store] then
		locationRobbed = Config.LokaceSafe[store]
		locationRobbed.lastRobbed = os.time()
	elseif Config.VaultLokace[store] then
		locationRobbed = Config.VaultLokace[store]
		locationRobbed.lastRobbed = os.time()
	end
end)

RegisterServerEvent('nt-vykradacka:notify')
AddEventHandler('nt-vykradacka:notify', function(type, store)
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local locationblip

	if Config.LokaceObchodu[store] then
		locationblip = Config.LokaceObchodu[store]
	elseif Config.LokaceSafe[store] then
		locationblip = Config.LokaceSafe[store]
	elseif Config.VaultLokace[store] then
		locationblip = Config.VaultLokace[store]
	end

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			if type == 1 then
				TriggerClientEvent('nt-vykradacka:drawblip', xPlayers[i], locationblip.coords)
			elseif type == 2 then
				TriggerClientEvent('nt-vykradacka:removeblip', xPlayers[i])
			end
		end
	end
end)
