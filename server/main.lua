-- https://github.com/kqpi

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('k_kity:dajitem')
AddEventHandler('k_kity:dajitem', function(item, ilosc)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
			
	xPlayer.addInventoryItem(item, ilosc)
		
end)

RegisterServerEvent('k_kity:dajbron')
AddEventHandler('k_kity:dajbron', function(bron, ammo)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
			
	xPlayer.addWeapon(bron, ammo)
		
end)