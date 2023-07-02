local act = wezterm.action

return {
	color_scheme = "$COLOR",
	font_dirs = { "$FONT_DIRS" },
	font = wezterm.font_with_fallback({ "$FONTS" }),
	font_size = 24.0,
	enable_scroll_bar = true,
	adjust_window_size_when_changing_font_size = false,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	enable_kitty_graphics = true,
	use_fancy_tab_bar = false,
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	cursor_blink_rate = 500,
	default_cursor_style = "BlinkingBlock",
	window_close_confirmation = "NeverPrompt",
	leader = { key = "a", mods = "CTRL" },

	keys = {
		{ key = "p", mods = "CMD", action = act.ShowLauncher },
		{ key = "UpArrow", mods = "SHIFT", action = act.ScrollByPage(-1) },
		{ key = "DownArrow", mods = "SHIFT", action = act.ScrollByPage(1) },
		{
			key = "k",
			mods = "CMD",
			action = wezterm.action({ ClearScrollback = "ScrollbackAndViewport" }),
		},
		-- This will create a new split and run your default program inside it
		{
			key = "|",
			mods = "LEADER",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "-",
			mods = "LEADER",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		-- https://wezfurlong.org/wezterm/config/lua/keyassignment/CloseCurrentPane.html
		-- Closes the current pane. If that was the last pane in the tab, closes the tab. If that was the last tab, closes that window. If that was the last window, wezterm terminates.
		{
			key = "w",
			mods = "CMD",
			action = wezterm.action.CloseCurrentPane({ confirm = true }),
		},
		{
			key = "UpArrow",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action.AdjustPaneSize({ "Up", 1 }),
		},
		{
			key = "H",
			mods = "LEADER",
			action = act.AdjustPaneSize({ "Left", 5 }),
		},
		{
			key = "J",
			mods = "LEADER",
			action = act.AdjustPaneSize({ "Down", 5 }),
		},
		{ key = "K", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 5 }) },
		{
			key = "L",
			mods = "LEADER",
			action = act.AdjustPaneSize({ "Right", 5 }),
		},
		-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
		{
			key = "LeftArrow",
			mods = "OPT",
			action = wezterm.action({ SendString = "\x1bb" }),
		}, -- Make Option-Right equivalent to Alt-f; forward-word
		{
			key = "RightArrow",
			mods = "OPT",
			action = wezterm.action({ SendString = "\x1bf" }),
		},
		{
			key = "LeftArrow",
			mods = "CMD",
			action = wezterm.action({ SendString = "\x01" }),
		},
		{
			key = "RightArrow",
			mods = "CMD",
			action = wezterm.action({ SendString = "\x05" }),
		},
		{
			key = "Backspace",
			mods = "CMD",
			action = wezterm.action({ SendString = "\x15" }),
		},
	},
}
