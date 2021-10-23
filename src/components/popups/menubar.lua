local awful = require("awful")
local menubar = require("menubar")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local gfs = require("gears.filesystem")

require("awful.hotkeys_popup.keys")

-- apps menu
discord = "Discord"
telegram = "telegram-desktop"
spotify = "spotify"
browser = "qutebrowser"
appsmenu = "rofi -show drun"

-- tools menu
shoot = "flameshot gui"
editor = "nvim"
terminal = "alacritty"
editor_cmd = terminal .. " -e " .. editor
virtmgr = "virt-manager"
zoom = gfs.get_configuration_dir() .. "boomer"
browser = "firefox"

-- system menu
switch = "home-manager switch"
reboot = "doas reboot"
shutdown = "doas shutdown now"

-- apps table
apps = {
    { "DISCORD", discord },
    --{ "TELEGRAM", telegram },
    { "SPOTIFY", spotify },
    { "BROWSER", browser },
    --{ "MORE",    appsmenu },
}

-- tools table
tools = {
    { "SCREENSHOT", shoot },
    { "EDITOR", editor_cmd },
    { "VIRTMGR", virtmgr },
    { "TERMINAL", terminal },
    { "ZOOM", zoom }
}

-- system table
system = {
    { "SWITCH", switch },
    { "REBOOT", reboot },
    { "SHUTDOWN", shutdown }
}

--- table of awesome
awesomemenu = {
    { "HOTKEYS", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "MANUAL", terminal .. " -e man awesome" },
    { "EDIT CONFIG", editor_cmd .. " " .. awesome.conffile },
    { "RESTART", function() awesome.restart() end },
    { "EXIT", function() awesome.quit() end }
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
    image = beautiful.awesome_icon,
    menu = mymainmenu
})


-- Menubar configuration
menubar.utils.terminal = terminal
