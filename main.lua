-- Created by RezaNoel#0001
-- Version 1.2
-- _  _  _____  ____  __   
--( \( )(  _  )( ___)(  )  
-- )  (  )(_)(  )__)  )(__ 
--(_)\_)(_____)(____)(____)
  

i=1
function creatblip(name,color)
  CreateThread(function()
    if blips[i] then
    print("if-1 "..i)
    SetBlipSprite(blips[i].bblip, 0)
    SetBlipAsShortRange(blips[i].bblip, true)
    SetBlipColour(blips[i].bblip, blips[i].bcolor)
    SetBlipScale(blips[i].bblip, 1.0)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(blips[i].bname)
    EndTextCommandSetBlipName(blips[i].bblip)
    SetBlipAlpha(blips[i].bradius, 100)
    SetBlipColour(blips[i].bradius, blips[i].bcolor)
      i = i + 1
      print("if-2 "..i)
    else
    
    print("else "..i)
   
    local pedcoords=GetEntityCoords(PlayerPedId())
    blip = AddBlipForCoord(pedcoords.x, pedcoords.y, pedcoords.z)
    radiusBlip = AddBlipForRadius(pedcoords.x, pedcoords.y, pedcoords.z,100.0)
    blips[i]={bname=name,bcolor=color,bblip=blip,bradius=radiusBlip}
    SetBlipSprite(blip, 0)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, blips[i].bcolor)
    SetBlipScale(blip, 1.0)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(blips[i].bname)
    EndTextCommandSetBlipName(blip)
    SetBlipAlpha(radiusBlip, 100)
    SetBlipColour(radiusBlip, blips[i].bcolor)
    
    i = i + 1
    end
    
  end)
end

CreateThread(function()
TriggerEvent('chat:addSuggestion', '/cblip', 'name , color')

end)

RegisterCommand("cblip", function (source,args)creatblip(args[1],args[2])

end, false)

