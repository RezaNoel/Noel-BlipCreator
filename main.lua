candraw=true
Keys = {["E"] = 38}
function creatblip()
  CreateThread(function()
	  Wait(1)
    RemoveBlip(blip)
    RemoveBlip(radiusBlip)
    blip = AddBlipForCoord(config.blip.coords.x, config.blip.coords.y, config.blip.coords.z)
    radiusBlip = AddBlipForRadius(config.blip.coords.x, config.blip.coords.y, config.blip.coords.z,config.blip.radiusBlip)
    SetBlipSprite(blip, 0)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, config.blip.blipCol)
    SetBlipScale(blip, 1.0)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(config.blip.blipName)
    EndTextCommandSetBlipName(blip)
    SetBlipAlpha(radiusBlip, 100)
    SetBlipColour(radiusBlip, config.blip.blipCol)

  end)
end
function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end
function creatmarker()
  CreateThread(function ()
    while candraw==true do
      Wait(0)
      local pedCoords = GetEntityCoords(PlayerPedId())
      local distance    = Vdist(pedCoords.x, pedCoords.y, pedCoords.z, config.marker.coords.x, config.marker.coords.y, config.marker.coords.z)
      marker=DrawMarker(config.marker.type, config.marker.coords.x, config.marker.coords.y, config.marker.coords.z , 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, 67, 57, 111, 255, false, true, 2, nil, nil, false)
      if ( distance <= 1 ) then
        alert("~b~Press ~INPUT_PICKUP~ For Start")
        if IsControlJustReleased(0, Keys['E']) then
          candraw=false
          GiveWeaponToPed(PlayerPedId() ,"weapon_pistol",20, true , true)
          while true do
            Wait(0)
                      inpvpmarker=DrawMarker(28, config.marker.coords.x, config.marker.coords.y, config.marker.coords.z , 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 10.0, 10.0, 10.0, 255, 0, 0, 50, false, true, 2, nil, nil, false)

          end





        creatblip()
        end
      end
    end

  end)
	
end

RegisterCommand("ccap",function (source,args)  
  capname=args[1] 
end , false)
CreateThread(function ()
  while true do
    Wait(0)
    if capname then
    RegisterCommand("capdata",function (source,args)  
      caploc=args[1] 
      if caploc then
      print(caploc)
      else print("err")
      end
    end , false)
  
  end
  end
end)

