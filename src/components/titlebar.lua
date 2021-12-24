local awful = require("awful")
local wibox = require("wibox")

local helpers = require("src.helpers")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local maximizedButton = function(c)
  local widget = awful.titlebar.widget.button(c, "maximized", function(cl)
    return false
  end, function(cl, state)
    helpers.maximize(c)
  end)
  return widget
end

client.connect_signal("request::titlebars", function(c)
  awful.titlebar(c, {
    position = beautiful.titlebar_position or "top",
    size = beautiful.titlebar_size or dpi(30)
  }): setup {
    {
      {
        awful.titlebar.widget.closebutton(c),
        awful.titlebar.widget.minimizebutton(c),
        --awful.titlebar.widget.maximizedbutton(c),
        maximizedButton(c),
        layout = wibox.layout.fixed.horizontal,
      },
      left = dpi(6),
      top = dpi(5),
      bottom = dpi(5),
      right = dpi(6),
      widget = wibox.container.margin,
    },
    {
      awful.titlebar.widget.titlewidget(c),
      widget = wibox.layout.fixed.horizontal,
      buttons = {
        awful.button({}, 1, function()
            client.focus = c
            c:raise()
            awful.mouse.client.move(c)
        end),
        awful.button({}, 3, function()
          client.focus = c
          c:raise()
          awful.mouse.client.resize(c)
        end)
      }
    },
    nil,
    layout = wibox.layout.align.horizontal,
  }
end)
