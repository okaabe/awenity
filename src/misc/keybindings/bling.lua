local awful = require("awful")
require("awful.autofocus")
local bling = require("libs.bling")

-- Bling related keybindings
awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers = { modkey },
        key = "p",
        group = "Bling",
        description = "Enable tabbed mode",
        on_press = function()
            bling.module.tabbed.pick()
        end,
    },
    awful.key {
        modifiers = { modkey, shiftkey },
        key = "-",
        group = "Bling",
        description = "Remove window from tabbed mode",
        on_press = function()
            bling.module.tabbed.pop()
        end,
    },
    awful.key {
        modifiers = { modkey, shiftkey },
        key = "s",
        group = "Bling",
        description = "Iterate through tabbed windows",
        on_press = function()
            bling.module.tabbed.iter()
        end,
    },
})
