-- Vehicle prices n names.
local vehicles = {"insurgent2", "adder", "kuruma2", "tailgater", "police", "buffalo", "burrito", "cheetah", "cavalcade", "coquette", "dubsta", "bati", "emperor2", "elegy2", "buccaneer", "sandking2", "ruiner"}
local vehicle_prices = {1000000, 900000, 250000, 25000, 100000, 17000, 10000, 30000, 75000, 45000, 27000, 7000, 5000, 50000, 35000, }

function personalVehicleChatCommands(source, command)
	if(command[1] == "/pv") then
		
		if(command[2] ~= nil)then
			if(command[2] == "buy")then
				if(command[3] ~= nil)then
					for i, name in ipairs(vehicles) do
						print(vehicles[i])
						if(command[3] == vehicles[i])then
							if(Users[GetPlayerName(source)]['money'] >= vehicle_prices[i])then
								if(Users[GetPlayerName(source)]['personalvehicle'] == nil or Users[GetPlayerName(source)]['personalvehicle'] == "")then
									Users[GetPlayerName(source)]['money'] = Users[GetPlayerName(source)]['money'] - vehicle_prices[i]
									saveMoney(source)
									Users[GetPlayerName(source)]['personalvehicle'] = vehicles[i]
									savePersonalVehicle(source)
									TriggerClientEvent("chatMessage", source, '', { 0, 0x99, 255}, "^1You just bought the vehicle for ^2??"..vehicle_prices[i])
								else
									TriggerClientEvent("chatMessage", source, '', { 0, 0x99, 255}, "^1Please sell your current vehicle first using: /pv sell")
								end
							else
								TriggerClientEvent("chatMessage", source, '', { 0, 0x99, 255}, "^1You do not have enough money to buy this. You need: ^2??"..vehicle_prices[i])
							end
						end
					end
				else
					TriggerClientEvent("chatMessage", source, '', { 0, 0x99, 255}, "^1That vehicle is currently not sold as permanent vehicle.")
				end
			elseif(command[2] == "customize")then
				if(command[3] == nil)then
					TriggerClientEvent("chatMessage", source, '', { 0, 0x99, 255}, "^1Available options")
					TriggerClientEvent("chatMessage", source, '', { 0, 0x99, 255}, "color [Red] [Green] [Blue]")
					TriggerClientEvent("chatMessage", source, '', { 0, 0x99, 255}, "upgrade")
				else
					if(command[3] == "upgrade")then
						TriggerClientEvent("upgradePlayerVehicle", source)
						TriggerClientEvent("chatMessage", source, '', { 0, 0x99, 255}, "^2Upgraded personal vehicle.")
					elseif(command[3] == "color")then
						TriggerClientEvent("personalVehicleColor", source, command[4], command[5], command[6])
						TriggerClientEvent("chatMessage", source, '', { 0, 0x99, 255}, "^2Set personal vehicle colour succesfully.")
					elseif(command[3] == "colorp")then
						TriggerClientEvent("personalVehicleColorPrimary", source, command[4], command[5], command[6])
						TriggerClientEvent("chatMessage", source, '', { 0, 0x99, 255}, "^2Set personal vehicle colour primary succesfully.")
					elseif(command[3] == "colors")then
						TriggerClientEvent("personalVehicleColorSecondary", source, command[4], command[5], command[6])
						TriggerClientEvent("chatMessage", source, '', { 0, 0x99, 255}, "^2Set personal vehicle colour secondary succesfully.")
					elseif(command[3] == "fix")then
						TriggerClientEvent("fixPersonalVehicle", source)
						TriggerClientEvent("chatMessage", source, '', { 0, 0x99, 255}, "^2Fixed personal vehicle succesfully.")
					else
						TriggerClientEvent("chatMessage", source, '', { 0, 0x99, 255}, "^1Available options")
						TriggerClientEvent("chatMessage", source, '', { 0, 0x99, 255}, "color [Red] [Green] [Blue]")
						TriggerClientEvent("chatMessage", source, '', { 0, 0x99, 255}, "upgrade")
						TriggerClientEvent("chatMessage", source, '', { 0, 0x99, 255}, "fix")
					end
				end
			elseif(command[2] == "sell")then
				if(Users[GetPlayerName(source)]['personalvehicle'] ~= nil or Users[GetPlayerName(source)]['personalvehicle'] ~= "")then
					for i, name in ipairs(vehicles) do
						if(vehicles[i] == Users[GetPlayerName(source)]['personalvehicle'])then
							TriggerClientEvent("chatMessage", source, '', { 0, 0x99, 255}, "^1You sold your vehicle for: ^2$"..(tonumber(vehicle_prices[i])/2))
							Users[GetPlayerName(source)]['personalvehicle'] = ""
							savePersonalVehicle(source)
							Users[GetPlayerName(source)]['money'] = Users[GetPlayerName(source)]['money'] - (tonumber(vehicle_prices[i])/2)
							saveMoney(source)
						else
							TriggerClientEvent("chatMessage", source, '', { 0, 0x99, 255}, "^1Your vehicle cannot be sold. Unknown error.")
						end
					end
				else
					TriggerClientEvent("chatMessage", source, '', { 0, 0x99, 255}, "^1You currently do not have a personal vehicle. Buy one with /pv buy")
				end
			else
				TriggerClientEvent("chatMessage", source, '', { 0, 0x99, 255}, "^1Not a valid parameter these are valid: buy,sell")
			end
			
		else
			if(Users[GetPlayerName(source)]['personalvehicle'] ~= nil)then
				TriggerClientEvent("createCarAtPlayerPos", source, Users[GetPlayerName(source)]['personalvehicle'], true)
				TriggerClientEvent("chatMessage", source, '', { 0, 0x99, 255}, "^2You spawned your personal vehicle! To customize: /pv customize")
			else
				TriggerClientEvent("chatMessage", source, '', { 0, 0x99, 255}, "^1You do not have a personal vehicle, buy one with /pv buy [vehiclename]")
			end
		end
		
		return true
	end
end
