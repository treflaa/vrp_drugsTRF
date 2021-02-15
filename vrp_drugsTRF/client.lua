-------------------------------------------
--------- Drug System | treflaa -----------
--------- Discord : treflaa#6969 ----------
-------------------------------------------

vRPCtrf = {}
Tunnel.bindInterface("vrp_drugsTRF",vRPCtrf)
Proxy.addInterface("vrp_drugsTRF",vRPCtrf)
vRPStrf = Tunnel.getInterface("vrp_drugsTRF","vrp_drugsTRF")
vRP = Proxy.getInterface("vRP")

local marijuana = {-1886.6899414063,2102.2329101563,138.15519714355}     -- aici este locul de une iei marijuana // this is where you get marijuana
local cocaina = {-1883.0709228516,2111.1928710938,135.25761413574}     -- aici este locul de une iei cocaina // this is where you get cocaine
local heroina = {-1881.7303466797,2119.9982910156,132.16044616699}     -- aici este locul de une iei heroina // this is where you get heroin

RegisterNetEvent('locatie:droguriTRF')
AddEventHandler('locatie:droguriTRF', function()
	SetNewWaypoint(-1886.6899414063,2102.2329101563,138.15519714355)        -- aici este locatia la care iti pune waypoint pe harta dupa ce iei jobul // this is where you put the waypoint for the player to go make the drug
	vRP.notify({"~r~Ti-am setat locatia pe ~y~gps locatie de unde faci drogurile, cauta pe acolo printre randuri!"})
end)


Citizen.CreateThread(function ()   
	local dealer = -459818001
	RequestModel(dealer)
	while not HasModelLoaded(dealer) do
		Citizen.Wait(1)
		RequestModel(dealer)
	end 
    local dealerped =  CreatePed(4, dealer, -453.37661743164,1081.9835205078,326.68692016602, 0, false, true)       -- locatia unde se afla npc ul de unde iei jobul // the location of the npc
    SetEntityHeading(dealerped, 160.404)
    FreezeEntityPosition(dealerped, true)
    SetEntityInvincible(dealerped, true)
    SetBlockingOfNonTemporaryEvents(dealerped, true)
end)


Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -453.37661743164,1081.9835205078,327.68692016602, true ) < 1 then        -- de unde sa apesi E ca sa iei jobul // where to press E to get the job
				DrawSpecialText("Apasa [~g~E~s~] ca sa cumperi jobul de Traficant De Droguri ")
				if(IsControlJustPressed(1, 38)) then
				TriggerServerEvent('treflaa:iabanii')
			end
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId(-1)
        local pedc = GetEntityCoords(ped)
        if(Vdist(GetEntityCoords(GetPlayerPed(-1)),marijuana[1],marijuana[2],marijuana[3]) <= 3.0) then
            DrawSpecialText("~w~Apasa ~p~[E] ~w~pentru a incepe sa iei ~p~Marijuana~w~!")
            DrawMarker(22, marijuana[1],marijuana[2],marijuana[3], 0, 0, 0, 0, 0, 0, 0.4501,0.4501,0.4501, 255,255,255, 200, 0, 0, 0, 1, 0, 0, 0)
            if(Vdist(GetEntityCoords(GetPlayerPed(-1)),marijuana[1],marijuana[2],marijuana[3]) <= 1.0) then
                if IsControlJustPressed(0, 38) then
                        vRPCtrf.takemarijuana()
                end
            end
        end
    end
end)

function vRPCtrf.takemarijuana()
    local ped = GetPlayerPed(-1)
    vRPCtrf.faceanimatia()
    vRPStrf.iamarijuana()
    ClearPedTasks(ped)
end

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId(-1)
        local pedc = GetEntityCoords(ped)
        if(Vdist(GetEntityCoords(GetPlayerPed(-1)),cocaina[1],cocaina[2],cocaina[3]) <= 3.0) then
            DrawSpecialText("~w~Apasa ~p~[E] ~w~pentru a incepe sa iei ~p~Cocaina~w~!")
            DrawMarker(22, cocaina[1],cocaina[2],cocaina[3], 0, 0, 0, 0, 0, 0, 0.4501,0.4501,0.4501, 255,255,255, 200, 0, 0, 0, 1, 0, 0, 0)
            if(Vdist(GetEntityCoords(GetPlayerPed(-1)),cocaina[1],cocaina[2],cocaina[3]) <= 1.0) then
                if IsControlJustPressed(0, 38) then
                        vRPCtrf.takecocaina()
                end
            end
        end
    end
end)

function vRPCtrf.takecocaina()
    local ped = GetPlayerPed(-1)
    vRPCtrf.faceanimatia()
    vRPStrf.iacocaina()
    ClearPedTasks(ped)
end

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId(-1)
        local pedc = GetEntityCoords(ped)
        if(Vdist(GetEntityCoords(GetPlayerPed(-1)),heroina[1],heroina[2],heroina[3]) <= 3.0) then
            DrawSpecialText("~w~Apasa ~p~[E] ~w~pentru a incepe sa iei ~p~Heroina~w~!")
            DrawMarker(22, heroina[1],heroina[2],heroina[3], 0, 0, 0, 0, 0, 0, 0.4501,0.4501,0.4501, 255,255,255, 200, 0, 0, 0, 1, 0, 0, 0)
            if(Vdist(GetEntityCoords(GetPlayerPed(-1)),heroina[1],heroina[2],heroina[3]) <= 1.0) then
                if IsControlJustPressed(0, 38) then
                        vRPCtrf.takeheroina()
                end
            end
        end
    end
end)

function vRPCtrf.takeheroina()
    local ped = GetPlayerPed(-1)
    vRPCtrf.faceanimatia()
    vRPStrf.iaheroina()
    ClearPedTasks(ped)
end

function vRPCtrf.faceanimatia()
    local ped = GetPlayerPed(-1)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GARDENER_PLANT", 0, true)
    vRP.notify({"1/10"})
    Wait(3000) 
    vRP.notify({"Cu grija"})
    vRP.notify({"2/10"})
    Wait(3000) 
    vRP.notify({"3/10"})
    Wait(3000) 
    vRP.notify({"4/10"})
    Wait(3000) 
    vRP.notify({"5/10"})
    Wait(3000) 
    vRP.notify({"Ai grija sa nu te vada nimeni"})
    vRP.notify({"6/10"})
    Wait(3000) 
    vRP.notify({"7/10"})
    Wait(3000) 
    vRP.notify({"Hai mai repede"})
    vRP.notify({"8/10"})
    Wait(3000) 
    vRP.notify({"9/10"})
    Wait(3000) 
    vRP.notify({"10/10"})
end


function DrawSpecialText(m_text, showtime)
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end