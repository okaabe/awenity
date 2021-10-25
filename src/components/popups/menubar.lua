local awful = require("awful")
local menubar = require("menubar")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local gfs = require("gears.filesystem")

require("awful.hotkeys_popup.keys")

-- apps menu
discord = "Discord"
telegram = "telegram-desktop"
browser = "qutebrowser"
appsmenu = "rofi -show drun"

-- tools menu
shoot = "flameshot gui"
editor = "nvim"
terminal = "alacritty"
editor_cmd = terminal .. " -e " .. editor
zoom = gfs.get_configuration_dir() .. "libs/zoom"
browser = "firefox"

-- system menu
reboot = "reboot"
shutdown = "poweroff"

-- apps table
apps = {
    { "DISCORD", discord },
    { "BROWSER", browser },
}

-- tools table
tools = {
    { "SCREENSHOT", shoot },
    { "EDITOR", editor_cmd },
    { "TERMINAL", terminal },
    { "ZOOM", zoom }
}

-- system table
system = {
    { "REBOOT", reboot },
    { "SHUTDOWN", shutdown },
    { "EXIT", function() awesome.quit() end }
}

--- table of awesome
awesomemenu = {
    { "HOTKEYS", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "RESTART", function() awesome.restart() end },
}


mymainmenu = awful.menu({
    items = {
        { "APPS", apps },
        { "TOOLS", tools },
        { "SYSTEM", system },
        { "AWESOME", awesomemenu, beautiful.awesome_icon }
    }
})


mylauncher = awful.widget.launcher({
    menu = mymainmenu
})

-- Menubar configuration
menubar.utils.terminal = terminal
