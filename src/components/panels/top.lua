local awful = require("awful")
local wibox = require("wibox")

local helpers = require("src.helpers")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local focusedClient = function()
  if client.focus then
    return helpers.text(client.focus.name or client.focus.class or "OKAABE")
  end

  return helpers.text("okaabe")
end

local top = function(s)
  local topPanel = awful.wibar({
    screen = s,
    position = "top",
    width = s.geometry.width,
    height = dpi(30)
  })


  topPanel : setup {
    {
      focusedClient(),
      left = dpi(10),
      widget = wibox.container.margin,
    },
    nil,
    {
      {
        {
          format = "%D",
          align = "center",
          valign = "center",
          widget = wibox.widget.textclock,
        },
        layout = wibox.layout.fixed.horizontal,
      },
      right = dpi(5),
      widget = wibox.container.margin,
    },
    expand = "none",
    layout = wibox.layout.align.horizontal,
  }

  return topPanel
end

return top
