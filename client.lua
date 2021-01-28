ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(500)
    end
end)
RegisterNetEvent('mnm_notify_client:showNotification')
AddEventHandler('mnm_notify_client:showNotification', function(icon, title, info, desc, show)
    SendNUIMessage({
        action = 'notification',
        icon = icon,
        title = title,
        info = info,
        desc = desc,
        show = show,
    })
end)

RegisterNetEvent('mnm_notify_client:removeNotification')
AddEventHandler('mnm_notify_client:removeNotification', function(show)
    SendNUIMessage({
        action = 'notification',
        show = show,
    })
end)


--[[
    EXAMPLE HOW TO USE:

    TriggerEvent('mnm_notify_client:showNotification', '<i class="fas fa-university"></i>', 'BANK INTERACTIONS', 'PRESS  <span style="color: green;">[E]</span> TO OPEN BANK MENU', 'Los Santos Fleeca Bank', true)
    TriggerClientEvent('mnm_notify_client:showNotification', source, '<i class="fas fa-university"></i>', 'BANK INTERACTIONS', 'PRESS  <span style="color: green;">[E]</span> TO OPEN BANK MENU', 'Los Santos Fleeca Bank', true)

    TriggerEvent('mnm_notify_client:removeNotification', false)
    TriggerClientEvent('mnm_notify_client:removeNotification', source, false)
]]

