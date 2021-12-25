local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local helpers = require("src.helpers")
local beautiful = require("beautiful")

local dpi = beautiful.xresources.apply_dpi

local tasklist = function(s)
  return awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    style = {
      shape = helpers.rrect(3),
    },
    layout = {
      spacing = 0,
      spacing_widget = {
        shape = gears.shape.rectangle,
        widget = wibox.widget.separator,
      },
      layout = wibox.layout.fixed.vertical,
    },
    widget_template = {
      {
        {
          {
            id = "icon_role",
            widget = wibox.widget.imagebox,
          },
          margins = dpi(8),
          widget = wibox.container.margin,
        },
        id = "background_role",
        widget = wibox.container.background,
      },
      margins = dpi(4),
      widget = wibox.container.margin,
    },
    buttons = {
      awful.button({}, 1, function (c)
          if c == client.focus then
              c.minimized = true
          else
              c:emit_signal(
                  "request::activate",
                  "tasklist",
                  {raise = true}
              )
          end
      end),

      awful.button({}, 3, function()
          awful.menu.client_list({ theme = { width = 250 } })
      end)
    },
  }
end

local left = function(s)
  local dock = awful.wibar({
    screen = s,
    position = "left",
    width = beautiful.dock_size or dpi(55),
    bg = beautiful.bg_normal .. "AA"
  })

  dock : setup {
    helpers.box(helpers.image(
      beautiful.logo,
      nil,
      function()
        awful.spawn(appsmenu)
      end
    ), "#BD5945", 4),
    tasklist(s),
    layout = wibox.layout.align.vertical,
  }

  return dock
end

return left
