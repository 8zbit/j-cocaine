-- Developed By James.#9982

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('testything', function(source)
	local _source = source
	
	local xPlayer  = ESX.GetPlayerFromId(_source)

	print(xPlayer.getMoney())
end)

RegisterServerEvent("rh-cokepackage:get")
AddEventHandler("rh-cokepackage:get", function()
    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	Citizen.Wait(5)
			

	xPlayer.addInventoryItem("cokepackage", 1)
end)

ESX.RegisterServerCallback('coke:test', function (source, cb)
	local _source = source
	
	local xPlayer  = ESX.GetPlayerFromId(_source)
	Citizen.Wait(0)		
			
	if xPlayer.getMoney() >= 25000 then
		xPlayer.removeMoney(25000)
		Citizen.Wait(50)
		cb(true)
	else
		cb(false)
	end		
end)

ESX.RegisterServerCallback('coke:test2', function (source, cb)
	local _source = source
	
	local xPlayer  = ESX.GetPlayerFromId(_source)
	Citizen.Wait(0)		
			
	if xPlayer.getInventoryItem('purecokepackage').count >= 1 and xPlayer.getInventoryItem('dopebag').count >= 20 and xPlayer.getInventoryItem('drugscales').count >= 1 then
		xPlayer.removeInventoryItem("dopebag", 20)
		xPlayer.removeInventoryItem("purecokepackage", 1)
		xPlayer.addInventoryItem("cocainebag", 20)
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterUsableItem('cokepackage', function(source)
	TriggerClientEvent('rh-items:cokepackage', source)
end)

ESX.RegisterUsableItem('cocainebag', function(source)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('rh-items:cokebag', source)
	xPlayer.removeInventoryItem("cocainebag", 1)
end)
RegisterServerEvent("rh-cocaine:givePure")
AddEventHandler("rh-cocaine:givePure", function()
    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	Citizen.Wait(5)
			

	xPlayer.addInventoryItem("purecokepackage", 2)
	xPlayer.removeInventoryItem("cokepackage", 1)
end)

