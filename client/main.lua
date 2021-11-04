-- https://github.com/kqpi

local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}
ESX = nil
local lastaction = 0
local lastaction2 = 0


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
		SetNuiFocus(false, false)
	end
end)

RegisterCommand(Config.Komenda, function()
	showmenu()
end)

local GUImenu = false

function showmenu()
	GUImenu = true
	SetNuiFocus(true, true)
	SendNUIMessage({type = 'open'})
end
function hidemenu()
	SendNUIMessage({type = 'close'})
	GUImenu = false
end


RegisterNUICallback('jedzenie', function(data, cb)
	local year, month , day , hour, minute, second  = GetUtcTime()
	local idtrack = tonumber(hour..minute..second)
	local spamdetek = idtrack - lastaction
	if spamdetek < 0 then spamdetek = Config.Cooldown1 end
	if spamdetek <= Config.Cooldown1 and lastaction > 0 then
		lastaction = idtrack
		SetNuiFocus(false, false)
		TriggerEvent("pNotify:SendNotification", { text = "Zestaw można odbierać co " .. Config.Cooldown1 / 60 .. " minut", type = "warning", timeout = 5000, layout = "centerRight", queue = "right" })
		hidemenu()

	else
		lastaction = idtrack
		SetNuiFocus(false, false)
		TriggerServerEvent('k_kity:dajitem', 'bread', 10)
		TriggerServerEvent('k_kity:dajitem', 'water', 10)
		hidemenu()
		TriggerEvent("pNotify:SendNotification", { text = "Pomyślnie odebrałeś zestaw z Jedzeniem", type = "warning", timeout = 5000, layout = "centerRight", queue = "right" })
	end
end)

RegisterNUICallback('bron', function(data, cb)
	local year, month , day , hour, minute, second  = GetUtcTime()
	local idtrack2 = tonumber(hour..minute..second)
	local spamdetek2 = idtrack2 - lastaction2
	if spamdetek2 < 0 then spamdetek2 = Config.Cooldown2 end
	if spamdetek2 <= Config.Cooldown2 and lastaction2 > 0 then
		lastaction2 = idtrack2
		SetNuiFocus(false, false)
		TriggerEvent("pNotify:SendNotification", { text = "Zestaw można odbierać co " .. Config.Cooldown2 / 60 .. " minut", type = "warning", timeout = 5000, layout = "centerRight", queue = "right" })
		hidemenu()

	else
		lastaction2 = idtrack2
		SetNuiFocus(false, false)
		if Config.UzywajWeaponsynca == false then
			TriggerServerEvent('k_kity:dajbron', 'weapon_pistol', 250)
		elseif Config.UzywajWeaponsynca == true then
			TriggerServerEvent('k_kity:dajitem', 'pistol', 1)
			TriggerServerEvent('k_kity:dajitem', 'pistol_ammo', 250)
		end
		hidemenu()
		TriggerEvent("pNotify:SendNotification", { text = "Pomyślnie odebrałeś zestaw z Bronią", type = "warning", timeout = 5000, layout = "centerRight", queue = "right" })
	end
end)


RegisterNUICallback('esc', function(data, cb)
	SetNuiFocus(false, false)
	hidemenu()
end)