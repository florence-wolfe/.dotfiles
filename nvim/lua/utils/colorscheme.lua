local themes = { "catppuccin", "tokyonight" }

local M = {}

M.theme = themes[1]

M.lualine = M.theme
M.barbecue = M.theme
M.lazyvim = M.theme

--@return table<string, BufferlineHLGroup>
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
        foreground = C.blue,
      },
      ["i"] = {
        foreground = C.green,
      },
      ["v"] = {
        foreground = C.mauve,
      },
      ["V"] = {
        foreground = C.mauve,
      },
      ["\22"] = {
        foreground = C.mauve,
      },
      ["s"] = {
        foreground = C.mauve,
      },
      ["S"] = {
        foreground = C.mauve,
      },
      ["R"] = {
        foreground = C.red,
      },
      ["c"] = {
        foreground = C.peach,
      },
      ["t"] = {
        foreground = C.green,
      },
    }
  elseif M.theme == "tokyonight" then
    local T = require("tokyonight.colors").setup({ transform = true })
    return {
      ["n"] = {
        foreground = T.blue,
      },
      ["i"] = {
        foreground = T.green,
      },
      ["v"] = {
        foreground = T.magenta,
      },
      ["V"] = {
        foreground = T.magenta,
      },
      ["\22"] = {
        foreground = T.magenta,
      },
      ["s"] = {
        foreground = T.magenta,
      },
      ["S"] = {
        foreground = T.magenta,
      },
      ["R"] = {
        foreground = T.red,
      },
      ["c"] = {
        foreground = T.yellow,
      },
      ["t"] = {
        foreground = T.green1,
      },
    }
  end
end

-- M.get = function(kind)
--  switch(kind) {
--    "lualine": return M.lualine,
--    "barbecue": return M.barbecue,
--    "lazyvim": return M.lazyvim,
--    "bufferline": return M.bufferline(),
--    "modicator_mode": return M.modicator_mode(),
--    default: return M.theme,
--  }
-- end

return M
