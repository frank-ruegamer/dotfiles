local wibox = require("wibox")
local watch = require("awful.widget.watch")

local tempo_widget = wibox.widget({ align = "center", widget = wibox.widget.textbox })

local function update_tempo_status(_, stdout)
	tempo_widget:set_text("[MQ] " .. stdout)
end

local command =
[[ curl -s --user 'admin:admin' --header 'Origin: http://localhost' 'http://localhost:8161/api/jolokia/read/org.apache.activemq:type=Broker,brokerName=localhost,destinationType=Queue,destinationName=*' | jq -r '[.value | values[] | select(.QueueSize > 0) | "\(.Name): \(.QueueSize)"] | join(", ")' ]]
local watch_command = string.format([[ bash -c "%s" ]], command:gsub('"', '\\"'))

watch(watch_command, 10, update_tempo_status)

return tempo_widget
