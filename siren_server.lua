-- Sirens are stored in a table/array with playerid and toggle
local playersWithoutSiren = {}

RegisterServerEvent('SilentSiren')

AddEventHandler('SilentSiren', function(Toggle)
local netID = source
TriggerClientEvent('updateSirens', -1, netID, Toggle)
playersWithoutSiren[netID] = Toggle
end)