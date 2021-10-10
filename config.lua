Config = {}

Config.NahlasitPD = true -- PD Přijde hlášení o vykrádačce.

Config.Pokladna = 0 --Kolik je potřeba LSPD na vykradení registru
Config.Safe = 0 --Kolik je potřeba LSPD na vykradení safu (vzadu v obchodě)
Config.Vault = 4 --Kolik je potřeba LSPD na vykradení vaultu

Config.Kamery = false --Pokud používáte st-cctv jako alerty pro PD. Funguje pouze pokud Config.NahlasitPD = true. Defaultně false. Pokud je nastaveno na true wh-outlawalert pošle notify že se spustila kamera. pokud false wh-outlawalert obyčejně nahlásí vykrádačku na daném obchodě

Config.Tlacitko = 46 -- Tlačitko pro početí vykrádačky (Pamatujte že musíte změnit 3D text v client.lua) Defaultně 48 (z).


Config.PotrebaItem = false -- Chcete aby u sebe mel zlodej nastroj na vykradani? Defaultne false
Config.VykradaciItem = 'lockpick' -- Jmeno item v databazi ktery chcete pouzit pro vykradani.


Config.VykrPokladna = true --Zapnout vykradani registru? Defaultne true.
Config.VykrSafe = true --Zapnout vykradani safu? Defaultne true.
Config.VykrVault = false --Zapnout vykradani vaultu? Defaultne true.

Config.Cooldown = true --Zapne global cooldown

Config.PokladnaCooldown = 3000 --Cooldown Time (seconds) for cash registers.
Config.SafeCooldown = 3000 --Cooldown Time (seconds) for Safes.
Config.VaultCooldown = 3000 --Cooldown Time (seconds) for Vaults.

--Minimalni a maximalni prachy z vykradani registru
Config.PokladnaMin = 10
Config.PokladnaMax = 250

--Minimalni a maxinalni prachy z vykradani safu (V mistnosti vzadu)
Config.SafeMin = 500
Config.SafeMax = 1000

--Minimalni a maxinalni prachy z vykradani vaultu (V mistnosti vzadu)
Config.VaultMin = 15000
Config.VaultMax = 100000

--Config.Penizky = 'money' --Vyberte na jaky ucet (account) penize po vykradacce pujdou (money = do inventare) (bank = do banky) (black_money = spinave do inventare). money, black_money nebo bank.
--Momentalne nefunguje (ALE ŠAJNY TO OPRAVÍÍÍ).

Config.PokladnaTimer = 2000 --Cooldown Timer pro registry v sekundach
Config.SafeTimer = 3000 --Cooldown Timer pro safy (to vzadu) v sekundach
Config.VaultTimer = 5000 --Cooldown timer pro vaulty (pacific bank) v sekundach

--Mám ráda zábavy a hrozně ráda tancuju :pepeJam:


-- Lokace obchodu pro vykradani (x, y, z). Cam - Cislo kamery co se zapne pri vykradani (Kdyz je Config.Cameras = false tak se nic nestane :D ). Name - Jmeno lokace (Nema jiny ucel nez hlaseni policajtum). 
Config.LokaceObchodu = {
	[1] = {coords = vector3(1728.7, 6417.45, 34.04), name = "24/7 Paleto - 3030", cam = 18, lastRobbed = 0},
	[2] = {coords = vector3(1727.58, 6415.38, 34.04), name = "24/7 Paleto - 3030", cam = 18, lastRobbed = 0},
	[3] = {coords = vector3(1696.54, 4923.93, 41.06), name = "LTD Grapeseed - 2013", cam = 17, lastRobbed = 0},
	[4] = {coords = vector3(1698.04, 4922.86, 41.06), name = "LTD Grapeseed - 2013", cam = 17, lastRobbed = 0},
	[5] = {coords = vector3(1392.88, 3606.46, 33.98), name = "Liquor Ace - 1016", cam = 16, lastRobbed = 0},
	[6] = {coords = vector3(1960.01, 3739.99, 31.34), name = "24/7 Sandy Shores - 1036", cam = 14, lastRobbed = 0},
	[7] = {coords = vector3(1958.90, 3742.00, 31.34), name = "24/7 Sandy Shores - 1036", cam = 14, lastRobbed = 0},
	[8] = {coords = vector3(2676.0, 3280.58, 54.24), name = "LTD Senora Fwy - 957", cam = 15, lastRobbed = 0},
	[9] = {coords = vector3(2678.03, 3279.42, 54.24), name = "LTD Senora Fwy - 957", cam = 15, lastRobbed = 0},
	[10] = {coords = vector3(1166.00, 2710.87, 37.15), name = "Rob's Grand Senora Desert - 940", cam = 12, lastRobbed = 0},
	[11] = {coords = vector3(549.03, 2671.35, 41.15), name = "24/7 Harmony - 928", cam = 13, lastRobbed = 0},
	[12] = {coords = vector3(549.36, 2669.02, 41.15), name = "24/7 Harmony - 928", cam = 13, lastRobbed = 0},
	[13] = {coords = vector3(-3242.27, 1000.01, 11.83), name = "24/7 Chumash - 905", cam = 10, lastRobbed = 0},
	[14] = {coords = vector3(-3244.64, 1000.17, 11.83), name = "24/7 Chumash - 905", cam = 10, lastRobbed = 0},
	[15] = {coords = vector3(-3038.96, 584.56, 6.90), name = "24/7 Ineseno Road - 804", cam = 9, lastRobbed = 0},
	[16] = {coords = vector3(-3041.15, 583.86, 6.90), name = "24/7 Ineseno Road - 804", cam = 9, lastRobbed = 0},
	[17] = {coords = vector3(-2966.40, 390.89, 14.04), name = "Rob's Banham Canyon - 815", cam = 8, lastRobbed = 0},
	[18] = {coords = vector3(-1820.21, 794.31, 137.08), name = "LTD Route 11 - 817", cam = 7, lastRobbed = 0},
	[19] = {coords = vector3(-1818.89, 792.94, 137.08), name = "LTD Route 11 - 817", cam = 7, lastRobbed = 0},
	[20] = {coords = vector3(2557.16, 380.85, 107.62), name = "LTD Route 15 - 402", cam = 11, lastRobbed = 0},
	[21] = {coords = vector3(2554.82, 380.90, 107.62), name = "LTD Route 15 - 402", cam = 11, lastRobbed = 0},
	[22] = {coords = vector3(372.53, 326.46, 102.56), name = "24/7 Clinton Avenue - 574", cam = 6, lastRobbed = 0},
	[23] = {coords = vector3(373.12, 328.65, 102.56), name = "24/7 Clinton Avenue - 574", cam = 6, lastRobbed = 0},
	[24] = {coords = vector3(1164.88, -322.72, 68.21), name = "LTD Mirror Park - 411", cam = 5, lastRobbed = 0},
	[25] = {coords = vector3(1165.05, -324.45, 68.21), name = "LTD Mirror Park - 411", cam = 5, lastRobbed = 0},
	[26] = {coords = vector3(-1486.18, -377.95, 39.16), name = "Rob's Morningwood - 635", cam = 'NIL', lastRobbed = 0},
	[27] = {coords = vector3(-1221.95, -908.37, 11.32), name = "Rob's Vespucci - 333", cam = 4, lastRobbed = 0},
	[28] = {coords = vector3(1134.22, -982.37, 45.41), name = "Rob's Murrieta Heights - 449", cam = 'NIL', lastRobbed = 0},
	[29] = {coords = vector3(24.46, -1347.30, 28.49), name = "24/7 Strawberry - 125", cam = 1, lastRobbed = 0},
	[30] = {coords = vector3(24.39, -1344.92, 28.49), name = "24/7 Strawberry - 125", cam = 1, lastRobbed = 0},
	[31] = {coords = vector3(-46.66, -1757.92, 28.42), name = "LTD Davis - 120", cam = 2, lastRobbed = 0},
	[32] = {coords = vector3(-47.86, -1759.34, 28.42), name = "LTD Davis - 120", cam = 2, lastRobbed = 0},
}

Config.LokaceSafe = {
	[1] = {coords = vector3(1734.9, 6420.86, 34.04), name = "24/7 Paleto - 3030", cam = 18, lastRobbed = 0},
	[2] = {coords = vector3(1707.85, 4920.40, 41.06), name = "LTD Grapeseed - 2013", cam = 17, lastRobbed = 0},
    [3] = {coords = vector3(1959.31, 3748.90, 31.34), name = "24/7 Sandy Shores - 1036", cam = 14, lastRobbed = 0},
	[4] = {coords = vector3(2672.76, 3286.61, 54.24), name = "LTD Senora Fwy - 957", cam = 15, lastRobbed = 0},
	[5] = {coords = vector3(1169.23, 2717.79, 36.15), name = "Rob's Grand Senora Desert - 940", cam = 12, lastRobbed = 0},
	[6] = {coords = vector3(546.41, 2662.83, 41.15), name = "24/7 Harmony - 928", cam = 13, lastRobbed = 0},
	[7] = {coords = vector3(-3250.00, 1004.38, 11.83), name = "24/7 Chumash - 905", cam = 10, lastRobbed = 0},
	[8] = {coords = vector3(-3047.90, 585.65, 6.90), name = "24/7 Ineseno Road - 804", cam = 9, lastRobbed = 0},
	[9] = {coords = vector3(-2959.58, 387.15, 13.04), name = "Rob's Banham Canyon - 815", cam = 8, lastRobbed = 0},
	[10] = {coords = vector3(-1829.15, 798.79, 137.19), name = "LTD Route 11 - 817", cam = 7, lastRobbed = 0},
	[11] = {coords = vector3(2549.21, 384.85, 107.62), name = "LTD Route 15 - 402", cam = 11, lastRobbed = 0},
	[12] = {coords = vector3(378.19, 333.35, 102.56), name = "24/7 Clinton Avenue - 574", cam = 6, lastRobbed = 0},
	[13] = {coords = vector3(1159.22, -314.0, 68.21), name = "LTD Mirror Park - 411", cam = 5, lastRobbed = 0},
	[14] = {coords = vector3(-1478.95, -375.38, 38.16), name = "Rob's Morningwood - 635", cam = 'NIL', lastRobbed = 0},
	[15] = {coords = vector3(-1220.79, -916.00, 10.32), name = "Rob's Vespucci - 333", cam = 4, lastRobbed = 0},
	[16] = {coords = vector3(1126.83, -980.14, 44.41), name = "Rob's Murrieta Heights - 449", cam = 'NIL', lastRobbed = 0},
	[17] = {coords = vector3(28.21, -1339.22, 28.49), name = "24/7 Strawberry - 125", cam = 1, lastRobbed = 0},
	[18] = {coords = vector3(-43.40, -1748.41, 28.42), name = "LTD Davis - 120", cam = 2, lastRobbed = 0},
}

Config.VaultLokace = {
	[1] = {coords = vector3(253.8, 228.26, 100.68), name = "Pacific Standard Vault - 575", cam = 25, lastRobbed = 0} --Tady toto potrebuje extra kameru pokud je pouzivate: '[25] =  { ['x'] = 252.41,['y'] = 225.44,['z'] = 102.88,['h'] = 289.79, ['info'] = ' Cam PS Vault' },'
}
