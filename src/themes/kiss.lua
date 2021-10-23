local theme_assets = require("beautiful.theme_assets")
local dpi          = require("beautiful.xresources").apply_dpi
local helpers      = require("libs.helpers")
local naughty      = require("naughty")
local gears          = require("gears")
 
local theme   = {}

-- Colors
theme.xfg                                       = "#F4F4F4"
theme.xbg                                       = "#222222" -- "#1A2026" -- "#F7F1E3"
theme.xbgdark                                   = "#333333" --"#242D35" -- "#FFF9EC"---"#14181d"
theme.xbglight                                  = "#5F676A"
theme.xcolor0                                   = "#222222" -- "#1A2026"
theme.xcolor8                                   = "#333333"
theme.xcolor1                                   = "#B68E7C"
theme.xcolor9                                   = "#B68E7C"
theme.xcolor2                                   = "#C6C4B9"
theme.xcolor10                                  = "#C6C4B9"
theme.xcolor3                                   = "#9B9992"
theme.xcolor11                                  = "#9B9992"
theme.xcolor4                                   = "#2B5575"
theme.xcolor12                                  = "#4A7798"
theme.xcolor5                                   = "#5A5A58"
theme.xcolor13                                  = "#5A5A58"
theme.xcolor6                                   = "#A47F82"
theme.xcolor14                                  = "#A47F82"
theme.xcolor7                                   = "#B0B0B0"
theme.xcolor15                                  = "#BBBBBB"

-- Global font
theme.font              = "PragmataProMonoLiga Nerd Font 11"-- "Iosevka 11"
theme.font_notifs       = "PragmataProMonoLiga Nerd Font 11"
theme.font_hotkeys      = "PragmataProMonoLiga Nerd Font 11"
theme.font_hotkeys_bold = "PragmataProMonoLiga Nerd Font 11"

-- Wibar Settigs
theme.wibar_height = dpi(40)
theme.wibar_border_width = dpi(2)
theme.wibar_border_color = theme.xbgdark

-- Wibox Background
theme.bg_normal     = theme.xbg 
theme.bg_focus      = theme.xbgdark
theme.bg_urgent     = "#79695a"
theme.bg_minimize   = "#201e1a"

-- Systray
theme.systray_icon_spacing = dpi(5)
theme.bg_systray    = theme.bg_focus

-- Wibox Foreground
theme.fg_normal     = theme.xcolor7
theme.fg_focus      = theme.xcolor15
theme.fg_urgent     = theme.xcolor2
theme.fg_minimize   = theme.xcolor8

-- Widget
theme.widget_bg = theme.xbgdark
theme.widget_margin = dpi(5)
theme.widget_padding = dpi(0)
theme.widget_radius = dpi(12)

-- Windows
theme.border_width      = dpi(0)
theme.border_radius     = dpi(8) -- dpi(15)
theme.border_focus      = theme.xbgdark -- theme.xcolor12 -- "#1F211D"
theme.border_normal     = theme.xbgdark -- "#1F211D"
theme.border_marked     = "#3c2b22"
theme.useless_gap       = dpi(0)
theme.gap_single_client = true
theme.snap_border_width = dpi(3)
theme.snap_border_color = "#3c2b22"

-- hotkeys
theme.hotkeys_font             = theme.font_hotkeys_bold
theme.hotkeys_description_font = theme.font_hotkeys
theme.hotkeys_border_width     = dpi(3)
theme.hotkeys_border_color     = theme.border_focus
theme.hotkeys_group_margin     = dpi(5)

-- mouse menu
theme.menu_height       = dpi(28)
theme.menu_width        = dpi(120)
theme.menu_font         = theme.font_menu
theme.menu_border_width = dpi(2)
theme.menu_border_color = theme.border_focus

-- menubar
theme.menuba_fg_normal     = theme.fg_normal
theme.menubar_bg_normal    = theme.bg_normal
theme.menubar_border_width = dpi(0)
theme.menubar_border_color = theme.titlebar_bg_focus
theme.menubar_fg_focus     = theme.fg_focus
theme.menubar_bg_focus     = theme.bg_focus

-- Naughty settings
theme.notification_font         = theme.font_notifs
theme.notification_bg           = theme.xbg
theme.notification_fg           = theme.fg_normal
theme.notification_icon_size    = dpi(52)
theme.notification_shape = helpers.rrect(3)
theme.notification_border_color = theme.border_normal

-- Bling tabbar settings
theme.tabbed_spawn_in_tab = true
theme.tabbar_style        = "i3"
theme.tabbar_size         = dpi(28)
theme.tabbar_ontop        = true
theme.tabbar_position     = "top"
--[[ Deprecated
theme.tabbar_color_close = "#674441"
theme.tabbar_color_min = "#84694e"
theme.tabbar_color_float = "#545e5e"
--]]
theme.tabbar_bg_normal = theme.xbg
theme.tabbar_fg_normal = theme.fg_normal
theme.tabbar_bg_focus  = theme.xcolor4
theme.tabbar_fg_focus  = theme.xfg
theme.tabbar_bg_focus_inactive = theme.xbglight


-- Bling mstab settings
theme.mstab_border_radius = dpi(0)
--[[
theme.mstab_bar_height      = dpi(40)
theme.mstab_font            = theme.font
]]
theme.mstab_bar_padding     = dpi(0)
--theme.mstab_tabbar_position = "right"
--[[theme.mstab_tabbar_style    = "boxes"
theme.mstab_tabbar_ontop    = true
theme.mstab_bg_focus        = theme.bg_focus
theme.mstab_fg_focus        = theme.fg_focus
theme.mstab_bg_normal       = theme.bg_normal
theme.mstab_fg_normal       = theme.fg_normal
--]]

-- Taglist
theme.taglist_fg_focus = theme.xcolor4
theme.taglist_fg_empty = theme.xcolor8
theme.taglist_fg_occupied = theme.xcolor2

-- Window switcher
theme.window_switcher_widget_bg = theme.xbg
theme.window_switcher_widget_border_color = theme.xbgdark
theme.window_switcher_name_normal_color = theme.xcolor8
theme.window_switcher_name_focus_color = theme.xcolor2
theme.window_switcher_clients_spacing = dpi(50)

-- TITLEBAR

theme.titlebar_bg_focus  = theme.xcolor4
theme.titlebar_bg_normal = theme.xcolor0
theme.titlebar_fg_focus  = theme.xfg
theme.titlebar_fg_normal = theme.xcolor15
theme.titlebar_height    = dpi(28)
theme.titlebar_margin = dpi(10)
theme.titlebar_spacing = dpi(3)
theme.titlebar_border_width = theme.border_width
theme.titlebar_border_color = theme.tborder_normal

local assets =  gears.filesystem.get_configuration_dir() .. "/assets/"

theme.titlebar_close_button_normal = assets .. 'titlebar/blocks/close_normal.png'
theme.titlebar_close_button_focus  = assets .. 'titlebar/blocks/close_focus.png'
theme.titlebar_close_button_normal_hover = assets .. 'titlebar/blocks/close_normal_hover.png'
theme.titlebar_close_button_focus_hover  = assets .. 'titlebar/blocks/close_focus_hover.png'

theme.titlebar_minimize_button_normal = assets .. "titlebar/blocks/minimize_normal.png"
theme.titlebar_minimize_button_focus  = assets .. "titlebar/blocks/minimize_focus.png"
theme.titlebar_minimize_button_normal_hover = assets .. "titlebar/blocks/minimize_normal_hover.png"
theme.titlebar_minimize_button_focus_hover  = assets .. "titlebar/blocks/minimize_focus_hover.png"

theme.titlebar_maximized_button_normal_inactive = assets .. "titlebar/blocks/maximized_normal.png"
theme.titlebar_maximized_button_focus_inactive  = assets .. "titlebar/blocks/maximize_focus.png"
theme.titlebar_maximized_button_normal_active = assets .. "titlebar/blocks/maximized_normal.png"
theme.titlebar_maximized_button_focus_active  = assets .. "titlebar/blocks/maximize_focus.png"
theme.titlebar_maximized_button_normal_inactive_hover = assets .. "titlebar/blocks/maximize_normal_hover.png"
theme.titlebar_maximized_button_focus_inactive_hover  = assets .. "titlebar/blocks/maximize_focus_hover.png"
theme.titlebar_maximized_button_normal_active_hover = assets .. "titlebar/blocks/maximize_normal_hover.png"
theme.titlebar_maximized_button_focus_active_hover  = assets .. "titlebar/blocks/maximize_focus_hover.png"

theme.titlebar_ontop_button_normal_inactive = assets .. "titlebar/blocks/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = assets .. "titlebar/blocks/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = assets .. "titlebar/blocks/ontop_normal_active.png"
theme.titlebar_ontop_button_normal_inactive_hover = assets .. "titlebar/blocks/ontop_normal_inactive_hover.png"
theme.titlebar_ontop_button_focus_inactive_hover  = assets .. "titlebar/blocks/ontop_focus_inactive_hover.png"
theme.titlebar_ontop_button_normal_active_hover = assets .. "titlebar/blocks/ontop_normal_active_hover.png"
theme.titlebar_ontop_button_focus_active_hover  = assets .. "titlebar/blocks/ontop_focus_active_hover.png"

theme.titlebar_floating_button_normal_inactive = assets .. "titlebar/blocks/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = assets .. "titlebar/blocks/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = assets .. "titlebar/blocks/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = assets .. "titlebar/blocks/floating_focus_active.png"

theme.titlebar_floating_button_normal_inactive_hover = assets .. "titlebar/blocks/floating_normal_inactive_hover.png"
theme.titlebar_floating_button_focus_inactive_hover  = assets .. "titlebar/blocks/floating_focus_inactive_hover.png"
theme.titlebar_floating_button_normal_active_hover = assets .. "titlebar/blocks/floating_normal_active_hover.png"
theme.titlebar_floating_button_focus_active_hover  = assets .. "titlebar/blocks/floating_focus_active_hover.png"

-- Awesome Icon
theme.awesome_icon = assets .. "ghosts/awesome.png"
theme.notif_icon   = assets .. "ghosts/notif.png"

theme.layout_max = assets .. "layout/max.png"
theme.layout_tile = assets .. "layout/tile.png"
theme.layout_floating = assets .. "layout/floating.png"
return theme


