Core = exports['cs_lib']:GetLib()

RegisterNetEvent('cs_sidebtn:add', function(id, text, prz)
    SendNUIMessage({ action = "add", id = id, text = text, prz = prz })
end)

RegisterNetEvent('cs_sidebtn:remove', function(id)
    SendNUIMessage({ action = "remove", id = id })
end)

RegisterNetEvent('cs_sidebtn:edit', function(id, text, prz)
    SendNUIMessage({ action = "edit", id = id, text = text, prz = prz })
end)

if Core.DevMode then
    Core.LoadDevCommands(GetCurrentResourceName(), {'testbutton','testbuttonrm'})
    RegisterCommand("testbutton", function(source, args, rawCommand)
        TriggerEvent('cs_sidebtn:add', 'help', 'Hey this is a test button', 'E')
    end, false)

    RegisterCommand("testbuttonrm", function(source, args, rawCommand)
        TriggerEvent('cs_sidebtn:remove', 'help')
    end, false)
end