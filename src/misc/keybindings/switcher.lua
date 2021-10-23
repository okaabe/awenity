local awful = require("awful")
local switcher = require("src.components.popups.switcher")

require("awful.autofocus")

awful.keyboard.append_global_keybindings({
	awful.key {
		modifiers = { winkey },
		key = "Tab",
		group = "Client",
		description = "Switch client",
		on_press = function()
			switcher.enable()
			-- switcher.switch( 1, "Mod1", "Alt_L", "Shift", "Tab")
		end,
	}
})
