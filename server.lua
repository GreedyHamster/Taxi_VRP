local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
 
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_taxi")

RegisterServerEvent('taxi:success') -- calls the event from client file
AddEventHandler('taxi:success', function(amount) -- handles the event
    local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
    vRP.giveMoney({user_id,amount})
    vRPclient.notify(player,{"You've been paid ~g~"..amount.."."})
end)
