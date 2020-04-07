-- Developed By James.#9982

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function DrawText3Ds(x,y,z, text)
  local onScreen,_x,_y=World3dToScreen2d(x,y,z)
  local px,py,pz=table.unpack(GetGameplayCamCoords())
  
  SetTextScale(0.35, 0.35)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextColour(255, 255, 255, 215)
  SetTextEntry("STRING")
  SetTextCentre(1)
  AddTextComponentString(text)
  DrawText(_x,_y)
  local factor = (string.len(text)) / 370
  DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 50)
end


Citizen.CreateThread(function()
  while true do
  	Citizen.Wait(1)

    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 870.61169433594, -2313.1809082031, 30.570411682129, true) < 1.5 then
		DrawText3Ds(870.47169433594, -2313.1809082031, 30.570411682129, "[E] - Buy Package | ($25,000)")

		if IsControlJustReleased(1, 38) then

			ESX.TriggerServerCallback('coke:test', function(output)
				thang = output

				if (thang == true) then
					TriggerServerEvent("cokepackage:get")
				else
					TriggerEvent('notification', "You don't have enough money.", 2)
				end

			end)

		end

	end

  end
end)

Citizen.CreateThread(function()
  while true do
  	Citizen.Wait(1)

    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 182.72648620605, -1918.7683105469, 22.360534667969, true) < 1.5 then
		DrawText3Ds(182.72648620605, -1918.7683105469, 22.360534667969, "[E] - Divide Package")

		if IsControlJustReleased(1, 38) then

			ESX.TriggerServerCallback('coke:test2', function(output)
				thang2 = output

				if (thang2 == true) then
					TriggerEvent('notification', "Later, homie!", 1)
				else
					TriggerEvent('notification', "Get outta here, dawg!", 2)
				end
				print(thang2)

			end)

		end

	end

  end
end)


RegisterNetEvent('items:cokepackage')
AddEventHandler('items:cokepackage', function()
	exports['mythic_progbar']:Progress({
			name = "cokepackage",
			duration = 20000,
			label = "Opening Package",
			useWhileDead = false,
			canCancel = true,

			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			},
	}, function(status)
		TriggerServerEvent('cocaine:givePure')
	end)
end)

RegisterNetEvent('items:cokebag')
AddEventHandler('items:cokebag', function()
	exports['mythic_progbar']:Progress({
			name = "cokebag",
			duration = 7000,
			label = "Coke Gaming",
			useWhileDead = false,
			canCancel = true,

			controlDisables = {
				disableMovement = false,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			},
	}, function(status)
		AnimpostfxPlay("DrugsMichaelAliensFight", 30000, false)
		Citizen.CreateThread(function()
			SetPedMoveRateOverride(PlayerId(), 7.5)
			SetRunSprintMultiplierForPlayer(PlayerId(), 1.29)
		end)
		Citizen.Wait(30000)
		AnimpostfxStop("DrugsMichaelAliensFight")
		Citizen.CreateThread(function()
			SetPedMoveRateOverride(PlayerId(), 0.00)
			SetRunSprintMultiplierForPlayer(PlayerId(), 1.00)
		end)
	end)
end)