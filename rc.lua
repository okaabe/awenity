pcall(require, "luarocks.loader")

local awful = require("awful")
local naughty = require("naughty")
local beautiful = require("beautiful")
local gfs = require("gears.filesystem")

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
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
}

-- Define tag names
screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag({"code", "work", "home", "college", "extra"}, s, awful.layout.layouts[1])
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
