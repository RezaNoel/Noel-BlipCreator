
function creatblip(name,radios,r,g,b)
  CreateThread(function()
	  Wait(1)
    local color={r=r,g=g,b=b}
    -- color.r=r
    -- color.g=g
    -- color.b=b
    local pedcoords=GetEntityCoords(PlayerPedId())
    blip = AddBlipForCoord(pedcoords.x, pedcoords.y, pedcoords.z)
    radiusBlip = AddBlipForRadius(pedcoords.x, pedcoords.y, pedcoords.z,radios)
    SetBlipSprite(blip, 0)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, color)
    SetBlipScale(blip, 1.0)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(name)
    EndTextCommandSetBlipName(blip)
    SetBlipAlpha(radiusBlip, 100)
    SetBlipColour(radiusBlip, color)

  end)
end


RegisterCommand("cblip", function (source,args)creatblip(args[1],args[2],args[3],args[4],args[5]) end, false)
