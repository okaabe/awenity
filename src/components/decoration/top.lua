local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local helpers = require("libs.helpers")

local dpi = beautiful.xresources.apply_dpi

client.connect_signal("request::titlebars", function(c)
    local colors = helpers.get_titlebar_colors_by_state(c)

    awful.titlebar(c, {
        size = beautiful.titlebar_height or dpi(30),
		ontop = true
    }): setup {
        layout = wibox.layout.align.vertical,
        expand = "none",
        nil,
        {
            {
                {
                    {
                        awful.titlebar.widget.titlewidget(c),
                        spacing = dpi(6),
                        layout = wibox.layout.fixed.horizontal,
                    },
                    left   = (beautiful.titlebar_margin or dpi(5)) + 5,
                    widget = wibox.container.margin,
                },
		        nil,
                nil,
                layout = wibox.layout.align.horizontal,
            },
            widget = wibox.container.background,
            colors = colors.background,
        },
        {

            bg = colors.border,
            forced_height = beautiful.border_width,
            widget = wibox.container.background,
        },
    }
    -- awful.titlebar(c, {
    --     size = beautiful.titlebar_height or dpi(30),
	-- 	ontop = true
    -- }): setup {
    --     {
    --         {
    --             awful.titlebar.widget.titlewidget(c),
    --             spacing = dpi(6),
    --             layout = wibox.layout.fixed.horizontal,
    --         },
    --         left   = (beautiful.titlebar_margin or dpi(5)) + 5,
    --         widget = wibox.container.margin,
    --     },
	--     nil,
    --     nil,
    --     layout = wibox.layout.align.horizontal,
    -- }
end)