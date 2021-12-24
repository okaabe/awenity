--  ███▄ ▄███▓ █    ██ ▄▄▄█████▓ ██▓ ███▄    █▓██   ██▓
-- ▓██▒▀█▀ ██▒ ██  ▓██▒▓  ██▒ ▓▒▓██▒ ██ ▀█   █ ▒██  ██▒
-- ▓██    ▓██░▓██  ▒██░▒ ▓██░ ▒░▒██▒▓██  ▀█ ██▒ ▒██ ██░
-- ▒██    ▒██ ▓▓█  ░██░░ ▓██▓ ░ ░██░▓██▒  ▐▌██▒ ░ ▐██▓░
-- ▒██▒   ░██▒▒▒█████▓   ▒██▒ ░ ░██░▒██░   ▓██░ ░ ██▒▓░
-- ░ ▒░   ░  ░░▒▓▒ ▒ ▒   ▒ ░░   ░▓  ░ ▒░   ▒ ▒   ██▒▒▒
-- ░  ░      ░░░▒░ ░ ░     ░     ▒ ░░ ░░   ░ ▒░▓██ ░▒░
-- ░      ░    ░░░ ░ ░   ░       ▒ ░   ░   ░ ░ ▒ ▒ ░░
--        ░      ░               ░           ░ ░ ░
--                                             ░ ░

local dpi          = require("beautiful.xresources").apply_dpi
local gears        = require("gears")
 
local theme   = {}

-- Global font
theme.font              = "Ubuntu Mono Bold 13"-- "PragmataProMonoLiga Nerd Font 11"

-- Wibox Background
theme.bg_normal     = "#454545"
theme.bg_focus      = "#454545"

-- Wibox Foreground
theme.fg_normal     = "#E2E2E2"
theme.fg_focus      = "#E2E2E2"

-- Windows
theme.border_width      = dpi(0)
theme.border_focus      = "#454545"
theme.border_normal     = "#454545"


-- Naughty settings
theme.notification_font         = theme.font
theme.notification_bg           = "#454545"
theme.notification_fg           = "#E2E2E2"
theme.notification_icon_size    = dpi(52)
theme.notification_border_color = "#454545"

theme.titlebar_size      = dpi(32)
theme.titlebar_bg_normal = "#454545"
theme.titlebar_bg_focus  = "#454545"

theme.dock_size = dpi(60)

theme.tasklist_bg_normal = "#57575799"
theme.tasklist_bg_focus = "#575757"

local tip = gears.filesystem.get_configuration_dir() .. "/assets/"

theme.logo = tip .. "logo.svg"

theme.titlebar_close_button_normal = tip .. 'titlebar/close_unfocused.svg'
theme.titlebar_close_button_focus  = tip .. 'titlebar/close.svg'

theme.titlebar_close_button_normal_hover = tip .. 'titlebar/close.svg'
theme.titlebar_close_button_focus_hover = tip .. 'titlebar/close_focused_prelight.svg'

theme.titlebar_minimize_button_normal = tip .. 'titlebar/minimize_unfocused.svg'
theme.titlebar_minimize_button_focus  = tip .. 'titlebar/minimize.svg'

theme.titlebar_minimize_button_focus_hover = tip .. 'titlebar/minimize_focused_prelight.svg'
theme.titlebar_minimize_button_normal_hover = tip .. 'titlebar/minimize.svg'

theme.titlebar_maximized_button_normal_inactive = tip .. 'titlebar/maximize_unfocused.svg'
theme.titlebar_maximized_button_normal_inactive_hover = tip .. 'titlebar/maximize_focused_normal.svg'
theme.titlebar_maximized_button_focus_inactive  = tip .. 'titlebar/maximize_focused_normal.svg'
theme.titlebar_maximized_button_focus_inactive_hover = tip .. 'titlebar/maximize_focused_prelight.svg'
theme.titlebar_maximized_button_normal_active = tip .. 'titlebar/maximize_unfocused_pressed.svg'
theme.titlebar_maximized_button_focus_active  = tip .. 'titlebar/maximize_focused_pressed.svg'

return theme


