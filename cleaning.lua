Citizen.CreateThread(function()
    while true 
    	do
    		-- These natives has to be called every frame.
    		SetVehicleDensityMultiplierThisFrame(0.3)
		SetPedDensityMultiplierThisFrame(0.3)
		SetRandomVehicleDensityMultiplierThisFrame(0.3)
		SetParkedVehicleDensityMultiplierThisFrame(0.3)
		SetScenarioPedDensityMultiplierThisFrame(0.3, 0.3)
		
		local playerPed = GetPlayerPed(-1)
		local pos = GetEntityCoords(playerPed) 
		RemoveVehiclesFromGeneratorsInArea(pos['x'] - 800.0, pos['y'] - 800.0, pos['z'] - 800.0, pos['x'] + 800.0, pos['y'] + 800.0, pos['z'] + 800.0);
		
		
		-- These natives do not have to be called everyframe.
		SetGarbageTrucks(1)
		SetRandomBoats(1)
    	
		Citizen.Wait(1)
	end

end)