local themes = { "catppuccin", "tokyonight" }

local M = {}

M.theme = themes[1]

M.lualine = M.theme
M.barbecue = M.theme
M.lazyvim = M.theme
M.bufferline = function()
  if M.theme == "catppuccin" then
    return require("catppuccin.groups.integrations.bufferline").get()
  end
end
M.modicator_mode = function()
  if M.theme == "catppuccin" then
    local C = require("catppuccin.palettes").get_palette()
    return {
      ["n"] = {
        foreground = C.mantle,
        background = C.blue,
      },
      ["i"] = {
        foreground = C.base,
        background = C.green,
      },
      ["v"] = {
        foreground = C.base,
        background = C.mauve,
      },
      ["V"] = {
        foreground = C.base,
        background = C.mauve,
      },
      ["\22"] = {
        foreground = C.base,
        background = C.mauve,
      },
      ["s"] = {
        foreground = C.base,
        background = C.mauve,
      },
      ["S"] = {
        foreground = C.base,
        background = C.mauve,
      },
      ["R"] = {
        foreground = C.base,
        background = C.red,
      },
      ["c"] = {
        foreground = C.base,
        background = C.peach,
      },
      ["t"] = {
        foreground = C.base,
        background = C.green,
      },
    }
  elseif M.theme == "tokyonight" then
    local T = require("tokyonight.colors").setup({ transform = true })
    return {
      ["n"] = {
        foreground = T.black,
        background = T.blue,
      },
      ["i"] = {
        foreground = T.black,
        background = T.green,
      },
      ["v"] = {
        foreground = T.black,
        background = T.magenta,
      },
      ["V"] = {
        foreground = T.black,
        background = T.magenta,
      },
      ["\22"] = {
        foreground = T.black,
        background = T.magenta,
      },
      ["s"] = {
        foreground = T.black,
        background = T.magenta,
      },
      ["S"] = {
        foreground = T.black,
        background = T.magenta,
      },
      ["R"] = {
        foreground = T.black,
        background = T.red,
      },
      ["c"] = {
        foreground = T.black,
        background = T.yellow,
      },
      ["t"] = {
        foreground = T.black,
        background = T.green1,
      },
    }
  end
end
return M
