local act = wezterm.action

return {
	color_scheme = "$COLOR",
	font_dirs = { "$FONT_DIRS" },
	font = wezterm.font_with_fallback({ "$FONTS" }),
	font_size = 16.0,
	enable_scroll_bar = true,
	adjust_window_size_when_changing_font_size = false,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	use_fancy_tab_bar = false,
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	cursor_blink_rate = 500,
	default_cursor_style = "BlinkingBlock",
	window_close_confirmation = "NeverPrompt",

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
			key = "+",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "-",
			mods = "CTRL|SHIFT|ALT",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
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
