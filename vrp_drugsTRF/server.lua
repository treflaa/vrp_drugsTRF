-------------------------------------------
--------- Drug System | treflaa -----------
--------- Discord : treflaa#6969 ----------
-------------------------------------------

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_drugsTRF")

vRPStrf = {}
Tunnel.bindInterface("vrp_drugsTRF",vRPStrf)
Proxy.addInterface("vrp_drugsTRF",vRPStrf)
vRPCtrf = Tunnel.getInterface("vrp_drugsTRF","vrp_drugsTRF")

RegisterServerEvent('treflaa:iabanii')
AddEventHandler('treflaa:iabanii', function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	if vRP.hasGroup({user_id,'Traficant de Droguri'}) then      -- jobul pe care il primeste // the job he receives
	vRPclient.notify(player, {"~r~Deja esti Traficant De Droguri"})
	else if vRP.tryFullPayment({user_id,200000}) then        -- cati bani sa coste jobul // how much money the job costs
		vRP.addUserGroup({user_id,'Traficant de Droguri'})
		vRPclient.notify(player, {"~r~Felicitari. ~b~Acum esti Traficant De Droguri"})
        TriggerClientEvent('locatie:droguriTRF', player)
	else
		vRPclient.notify(player, {"~r~Nu ai suficienti bani."})
	   end
	end
end)

function vRPStrf.iamarijuana()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id,"Traficant de Droguri"}) then
        if vRP.tryGetInventoryItem({user_id, "seeds", 1, true}) then      -- ce dai ca sa faci drogul // what you need to make the drug
            vRP.giveInventoryItem({user_id, 'weed', 1, true})       -- drogul pe care il primest // the drug he is receiving
            vRPclient.notify(player, {"Ai cules marijuana, acum du-te si vinde-o!"}) 
        end
    else
		vRPclient.notify(source,{"~r~Nu esti Traficant de Droguri vere, hai pleaca de aici sa nu-ti trag o palma!"})
	end
end

function vRPStrf.iacocaina()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id,"Traficant de Droguri"}) then
        if vRP.tryGetInventoryItem({user_id, "benzoilmetilecgonina", 1, true}) then      -- ce dai ca sa faci drogul // what you need to make the drug
            vRP.giveInventoryItem({user_id, 'cocaine', 1, true})       -- drogul pe care il primest // the drug he is receiving
            vRPclient.notify(player, {"Ai cules cocaina, acum du-te si vinde-o!"}) 
        end
    else
	    vRPclient.notify(source,{"~r~Nu esti Traficant de Droguri vere, hai pleaca de aici sa nu-ti trag o palma!"})
	end
end

function vRPStrf.iaheroina()
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    if vRP.hasGroup({user_id,"Traficant de Droguri"}) then
        if vRP.tryGetInventoryItem({user_id, "harness", 1, true}) then      -- ce dai ca sa faci drogul // what you need to make the drug
            vRP.giveInventoryItem({user_id, 'heroine', 1, true})       -- drogul pe care il primest // the drug he is receiving
            vRPclient.notify(player, {"Ai cules heroina, acum du-te si vinde-o!"}) 
        end
    else
		vRPclient.notify(source,{"~r~Nu esti Traficant de Droguri vere, hai pleaca de aici sa nu-ti trag o palma!"})
	end
end
