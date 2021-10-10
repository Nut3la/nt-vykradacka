local robbing = false
local robbinglocation = nil
local camera = nil
local robbinglocation2 = nil
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function InCashRegZone(coords)
    Location = Config.LokaceObchodu
    for i = 1, #Location, 1 do
        if GetDistanceBetweenCoords(coords, Location[i].coords.x, Location[i].coords.y, Location[i].coords.z, true) < 1.5 then
        	robbinglocation = Location[i].name
        	if Config.Kamery then
        		camera = Location[i].cam
        	end
            return true
        end
    end
    return false
end

function InSafeZone(coords)
    Location = Config.LokaceSafe
    for i = 1, #Location, 1 do
        if GetDistanceBetweenCoords(coords, Location[i].coords.x, Location[i].coords.y, Location[i].coords.z, true) < 1.5 then
        	robbinglocation = Location[i].name
        	if Config.Kamery then
        		camera = Location[i].cam
        	end
            return true
        end
    end
    return false
end

function InVaultZone(coords)
    Location = Config.VaultLokace
    for i = 1, #Location, 1 do
        if GetDistanceBetweenCoords(coords, Location[i].coords.x, Location[i].coords.y, Location[i].coords.z, true) < 1.5 then
        	robbinglocation = Location[i].name
        	if Config.Kamery then
        		camera = Location[i].cam
        	end
            return true
        end
    end
    return false
end

RegisterNetEvent('nt-vykradacka:drawblip')
AddEventHandler('nt-vykradacka:drawblip', function(coords)
	blip = AddBlipForCoord(coords.x, coords.y, coords.z)
	SetBlipSprite(blip, 161)
	SetBlipScale(blip, 2.0)
	SetBlipColour(blip, 3)
	PulseBlip(blip)
end)

RegisterNetEvent('nt-vykradacka:removeblip')
AddEventHandler('nt-vykradacka:removeblip', function()
	RemoveBlip(blip)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		if not Config.PotrebaItem then
			player = GetPlayerPed(-1)
			coords = GetEntityCoords(player)

			-- Pokladny
			if Config.VykrPokladna then
				if InCashRegZone(coords) then
					if IsControlJustReleased(0, Config.Tlacitko) and IsInputDisabled(0) then
						
						TriggerServerEvent('nt-vykradacka:cops', "cashreg", robbinglocation2)
					end
				end
			end

			-- Safes
			if Config.VykrSafe then
				if InSafeZone(coords) then
					if IsControlJustReleased(0, Config.Tlacitko) and IsInputDisabled(0) then
						TriggerServerEvent('nt-vykradacka:cops', "safe", robbinglocation2)
					end
				end
			end

			-- Vaults
			if Config.VykrVault then
				if InVaultZone(coords) then
					if IsControlJustReleased(0, Config.Tlacitko) and IsInputDisabled(0) then
						TriggerServerEvent('nt-vykradacka:cops', "vault", robbinglocation2)
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        player = GetPlayerPed(-1)
        coords = GetEntityCoords(player)

        if Config.VykrPokladna then
	        for k, v in pairs(Config.LokaceObchodu) do
	            if GetDistanceBetweenCoords(coords, Config.LokaceObchodu[k].coords.x, Config.LokaceObchodu[k].coords.y, Config.LokaceObchodu[k].coords.z, true) < 1.5  then
	                if not Config.PotrebaItem then
						ESX.Game.Utils.DrawText3D(vector3(Config.LokaceObchodu[k].coords.x, Config.LokaceObchodu[k].coords.y, Config.LokaceObchodu[k].coords.z + 1.0), "Stiskni [E] Pro vykradení registru", 0.6)
					end
					robbinglocation2 = k
	            end
	        end
	    end

	    if Config.EnableSafe then
	        for k, v in pairs(Config.SafeLocations) do
	            if GetDistanceBetweenCoords(coords, Config.LokaceSafe[k].coords.x, Config.LokaceSafe[k].coords.y, Config.LokaceSafe[k].coords.z, true) < 1.5 then
					if not Config.EnableItemTrigger then
						ESX.Game.Utils.DrawText3D(vector3(Config.LokaceSafe[k].coords.x, Config.LokaceSafe[k].coords.y, Config.LokaceSafe[k].coords.z + 1.0), "Stiskni [E] Pro vykradení safu", 0.6)
	                end
					robbinglocation2 = k
	            end
	        end
	    end

	    if Config.EnableVault then
	        for k, v in pairs(Config.VaultLocations) do
	            if GetDistanceBetweenCoords(coords, Config.VaultLokace[k].coords.x, Config.VaultLokace[k].coords.y, Config.VaultLokace[k].coords.z, true) < 1.5 then
	                if not Config.EnableItemTrigger then
						ESX.Game.Utils.DrawText3D(vector3(Config.VaultLokace[k].coords.x, Config.VaultLokace[k].coords.y, Config.VaultLokace[k].coords.z + 1.0), "Stiskni [E] Pro vykradení vaultu", 0.6)
					end
					robbinglocation2 = k
	            end
	        end
	    end
	end
end)

RegisterNetEvent('nt-vykradacka:cashregrob')
AddEventHandler('nt-vykradacka:cashregrob', function()
	player = GetPlayerPed(-1)
    coords = GetEntityCoords(player)
	if Config.NahlasitPD then
		if Config.Kamery then
			TriggerServerEvent('esx_outlawalert:cameraTriggered', camera, robbinglocation)
		else
			TriggerServerEvent('esx_outlawalert:storeRobbery', robbinglocation)
		end
		TriggerServerEvent('nt-vykradacka:notify', 1, robbinglocation2)
	end
	exports['mythic_notify']:DoCustomHudText('inform', 'A a D pro pohyb. W pro prijeti, S pro zruseni. GL', 7000)

	local res = exports['nt-vykradacka']:createSafe({math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99)})
	if res == true then
		local player = GetPlayerFromServerId(source)
		TriggerServerEvent('nt-vykradacka:notify', 2)
		TriggerServerEvent('nt-vykradacka:ReceiveMonies', res)

		if Config.Cooldown then
			TriggerServerEvent('nt-vykradacka:completed', robbinglocation2)
		end
	else
		exports['mythic_notify']:DoHudText('error', 'Nepovedlo se!')
		TriggerServerEvent('nt-vykradacka:notify', 2)
		if Config.PotrebaItem then
			TriggerServerEvent('nt-vykradacka:fail')
		end
	end
end)


RegisterNetEvent('nt-vykradacka:saferob')
AddEventHandler('nt-vykradacka:saferob', function()
	if Config.NahlasitPD then
		if Config.Kamery then
			TriggerServerEvent('esx_outlawalert:cameraTriggered', camera, robbinglocation)
		else
			TriggerServerEvent('esx_outlawalert:storeRobbery', robbinglocation)
		end
		TriggerServerEvent('nt-vykradacka:notify', 1, robbinglocation2)
	end
	exports['mythic_notify']:DoCustomHudText('inform', 'A a D pro pohyb. W pro prijeti, S pro zruseni. GL', 7000)
	--Citizen.Wait(200)
	local res = exports['nt-vykradacka']:createSafe({math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99)})
	if res == true then
		TriggerServerEvent('nt-vykradacka:notify', 2)
		local player = GetPlayerFromServerId(source)
		TriggerServerEvent('nt-vykradacka:ReceiveMonies', res)

		if Config.Cooldown then
			TriggerServerEvent('nt-vykradacka:completed', robbinglocation2)
		end
	else
		exports['mythic_notify']:DoHudText('error', 'Nepovedlo se!')
		TriggerServerEvent('nt-vykradacka:notify', 2)
		if Config.PotrebaItem then
			TriggerServerEvent('nt-vykradacka:fail')
		end
	end
end)

RegisterNetEvent('nt-vykradacka:vaultrob')
AddEventHandler('nt-vykradacka:vaultrob', function()
	if Config.NahlasitPD then
		if Config.Kamery then
			TriggerServerEvent('esx_outlawalert:cameraTriggered', camera, robbinglocation)
		else
			TriggerServerEvent('esx_outlawalert:storeRobbery', robbinglocation)
		end
		TriggerServerEvent('nt-vykradacka:notify', 1, robbinglocation2)
	end
	exports['mythic_notify']:DoCustomHudText('inform', 'A a D pro pohyb. W pro prijeti, S pro zruseni. GL', 7000)
	--Citizen.Wait(200)
	local res = exports['nt-vykradacka']:createSafe({math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99),math.random(0,99)})
	if res == true then
		TriggerServerEvent('nt-vykradacka:notify', 2)
		local player = GetPlayerFromServerId(source)
		TriggerServerEvent('nt-vykradacka:ReceiveMonies', res)

		if Config.Cooldown then
			TriggerServerEvent('nt-vykradacka:completed', robbinglocation2)
		end
	else
		exports['mythic_notify']:DoHudText('error', 'Nepovedlo se!')
		TriggerServerEvent('nt-vykradacka:notify', 2)
		if Config.PotrebaItem then
			TriggerServerEvent('nt-vykradacka:fail')
		end
	end
end)

if Config.PotrebaItem then
	RegisterNetEvent('nt-vykradacka')
	AddEventHandler('nt-vykradacka', function()
		print("here")
		player = GetPlayerPed(-1)
		coords = GetEntityCoords(player)

		-- Cash Registers
		if Config.VykrPokladna then
			if InCashRegZone(coords) then
				TriggerServerEvent('nt-vykradacka:cops', "cashreg", robbinglocation2)
			end
		end

		-- Safes
		if Config.VykrSafe then
			if InSafeZone(coords) then
				TriggerServerEvent('nt-vykradacka:cops', "safe", robbinglocation2)
			end
		end

		-- Vaults
		if Config.VykrVault then
			if InVaultZone(coords) then
				TriggerServerEvent('nt-vykradacka:cops', "vault", robbinglocation2)
			end
		end
	end)
end