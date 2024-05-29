local wibox = require("wibox")
local watch = require("awful.widget.watch")

local spotify_widget = wibox.widget({align = "center", widget = wibox.widget.textbox})

local pattern = "(%a+)%s(.+)"

local function update_spotify_status(_, stdout)
  if stdout ~= "" then
    local status, metadata = stdout:match(pattern)
    if status == "Playing" then
      stdout = "🎵 " .. metadata
    else
      stdout = ""
    end
  end

  spotify_widget:emit_signal("content_changed", stdout ~= "")
  spotify_widget:set_text(stdout)
end

watch("playerctl -p spotify metadata -f '{{status}} {{artist}} – {{title}}'", 5, update_spotify_status)

return spotify_widget
