local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local dpi = beautiful.xresources.apply_dpi

client.connect_signal("request::titlebars", function(c)
    local buttons = {
        awful.button({ }, 1, function()
            client.focus = c
            c:raise()
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            client.focus = c
            c:raise()
            awful.mouse.client.resize(c)
        end)
    }

    awful.titlebar(c, {
        size = beautiful.titlebar_height or dpi(30),
		ontop = true
    }): setup {
        {
            {
                awful.titlebar.widget.titlewidget(c),
		        buttons = buttons,
                layout = wibox.layout.fixed.horizontal,
            },
            left   = (beautiful.titlebar_margin or dpi(5)) + 5,
            widget = wibox.container.margin,
        },
        {
            buttons = buttons,
            layout = wibox.layout.fixed.horizontal,
        },
        nil,
        layout = wibox.layout.align.horizontal,
    }
end)
