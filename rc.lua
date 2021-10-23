pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
local naughty = require("naughty")
local beautiful = require("beautiful")
local helpers = require("libs.helpers")
local gfs = require("gears.filesystem")


-- Error on startup notification:
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title = "An error happened"..(startup and " during startup!" or "!"),
        message = message
    }
end)


-- Initialize selected theme.
beautiful.init(gfs.get_configuration_dir() .. "src/themes/kiss.lua")

-- garbage collector
collectgarbage("step", 1024)
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)



-- modifiers
modkey = "Mod4"
winkey = "Mod1"
shiftkey = "Shift"
controlkey = "Control"


-- Load external modules
local bling = require("libs.bling")

local tile = awful.layout.suit.tile
local floating = awful.layout.suit.floating
local mstab = bling.layout.mstab

awful.layout.layouts = {
    tile,
    floating,
    -- mstab,
    -- bling.layout.centered,
}

local gap_size = beautiful.useless_gap

-- Define tag names
screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag({ "", "", "", "", "ﭮ" }, s, awful.layout.layouts[1])
    --awful.tag({"code", "work", "home", "college", "extra"}, s, awful.layout.layouts[1])
end)

-- Focus on click
client.connect_signal("focus",
    function(c)
        c.border_color = beautiful.border_focus
end)

client.connect_signal("unfocus",
    function(c)
        c.border_color = beautiful.border_normal
end)

-- Load modules
require("src")
require("libs.autostart")

