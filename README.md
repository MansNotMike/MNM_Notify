# MNM_Notify

**Info**<br>
MNM Notify is a very simple replacement for any 3D Text or notifications when inside a marker.
Feel free to edit / modify this. Be kind and provide some credits.
This is my first release so don't be a dick :)

*You can find me on:*<br>
**Twitch** www.twitch.tv/mansnotmike<br>
**Instagram** https://www.instagram.com/mansnotmike<br>
**Twitter** https://twitter.com/mans_mike<br>
**Discord** http://discord.gg/ujgNbqSugR<br>

<b>Usage</b><br>
Drop folder MNM_Notify in your resources folder and ensure in server.cfg.

There are events you can trigger when you are inside a marker.
<b>Show Notification</b>

  <i>-- CLIENT SIDE
  TriggerEvent('mnm_notify_client:showNotification', icon, title, info, desc, true)
  
  -- SERVER SIDE
  TriggerClientEvent('mnm_notify_client:showNotification', source, icon, title, info, desc, true)</i>

<b>Remove Notification</b>

  <i>-- CLIENT SIDE
  TriggerEvent('mnm_notify_client:removeNotification', false)
  
  -- SERVER SIDE
  TriggerClientEvent('mnm_notify_client:removeNotification', source, false)</i>
  
Example of how I use it inside a marker<br>
<b>--This is running at 0.03 - 0.04 inside the marker</b>

```lua
local showing = false
CreateThread(function()
	while true do
		local sleep = 1000
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		local Pos = vector3(314.21, -279.01, 54.17)
		local distance = #(coords - Pos)
		local onFoot = IsPedOnFoot(ped)
			if distance < 3 and not inMenu and onFoot then
				sleep = 5
				inMarker = true
				if not showing then
				TriggerEvent('mnm_notify_client:showNotification', '<i class="fas fa-university"></i>', 'BANK INTERACTIONS', 'PRESS  <span style="color: green;">[E]</span> TO OPEN BANK MENU', 'Los Santos Fleeca Bank', true)
				showing = true
				end
				DrawMarker(2, Pos.x, Pos.y, Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.1, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)
			else
				inMarker = false
				if showing then
					TriggerEvent('mnm_notify_client:removeNotification', false)
					showing = false
				end
			end

			if IsControlJustReleased(0, 38) and not inMenu and inMarker then
				openNUI()
			end
	Wait(sleep)
	end
end)
``` 


