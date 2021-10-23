-- helpers.lua
-- Functions that you use more than once and in different files would
-- be nice to define here.
local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local beautiful = require("beautiful")

local dpi = beautiful.xresources.apply_dpi

local helpers = {}

function helpers.handle_dpi(value, default)
    return dpi(value or default)
end

function helpers.box(wid, margin, padding, background, radius)
    return wibox.widget {
        {
            {
                wid,
                top = helpers.handle_dpi(padding, 5),
                bottom = helpers.handle_dpi(padding, 5),
                left = helpers.handle_dpi(padding, 5) + 5,
                right = helpers.handle_dpi(padding, 5) + 5,
                widget = wibox.container.margin,
            },
            bg = background or beautiful.widget_bg or beautiful.bg_focus or "#000000",
            shape = helpers.rrect(dpi(radius or beautiful.widget_radius or 0)),
            widget = wibox.container.background,
        },
        margins = dpi(margin or 5),
        widget = wibox.container.margin,
    }
end

function helpers.add_click_event(wid, callback)
    if (callback) then
        wid:buttons({
            awful.button({}, 1, function()
                callback()
	    end)
	})
    end

    return wid
end

-- wibox.widget.imagebox wrapper
function helpers.icon(img, top, bottom, left, right, callback)
    return helpers.add_click_event(wibox.widget {
        {
            widget = wibox.widget.imagebox,
            image = img,
            resize = true,
        },
        top = top,
        bottom = bottom,
        left = left,
        right = right,
        widget = wibox.container.margin,
    }, callback)
end

-- Create rounded rectangle shape (in one line)
helpers.rrect = function(radius)
    return function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, radius or 0)
    end
end

-- Create pi
helpers.pie = function(width, height, start_angle, end_angle, radius)
    return function(cr)
        gears.shape.pie(cr, width, height, start_angle, end_angle, radius)
    end
end

-- Create parallelogram
helpers.prgram = function(height, base)
    return function(cr, width)
        gears.shape.parallelogram(cr, width, height, base)
    end
end

-- Create partially rounded rect
helpers.prrect = function(radius, tl, tr, br, bl)
    return function(cr, width, height)
        gears.shape.partially_rounded_rect(cr, width, height, tl, tr, br, bl,
                                           radius)
    end
end

-- Markup helper
function helpers.colorize_text(txt, fg)
    return "<span foreground='" .. fg .. "'>" .. txt .. "</span>"
end

function helpers.vertical_pad(height)
    return wibox.widget {
        forced_height = height,
        layout = wibox.layout.fixed.vertical
    }
end

function helpers.horizontal_pad(width)
    return wibox.widget {
        forced_width = width,
        layout = wibox.layout.fixed.horizontal
    }
end

function helpers.add_hover_cursor(w, hover_cursor)
    local original_cursor = "left_ptr"

    w:connect_signal("mouse::enter", function()
        local w = _G.mouse.current_wibox
        if w then w.cursor = hover_cursor end
    end)

    w:connect_signal("mouse::leave", function()
        local w = _G.mouse.current_wibox
        if w then w.cursor = original_cursor end
    end)
end

return helpers
