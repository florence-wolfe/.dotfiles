local themes = { "catppuccin", "tokyonight" }

local M = {}

M.theme = themes[1]

M.lualine = M.theme
M.barbecue = M.theme
M.lazyvim = M.theme

---@return table<string, BufferlineHLGroup>
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

--- Get the specified module.
--- @param kind string The name of the module to get.
M.get = function(kind)
  --- A table containing different modules.
  --- @class ModulesTable
  --- @field lualine string
  --- @field barbecue string
  --- @field lazyvim string
  --- @field bufferline table<string, BufferlineHLGroup>
  --- @field modicator_mode table
  --- @field theme string
  local modules = {
    ["lualine"] = M.lualine,
    ["barbecue"] = M.barbecue,
    ["lazyvim"] = M.lazyvim,
    ["bufferline"] = M.bufferline(),
    ["modicator_mode"] = M.modicator_mode(),
    ["theme"] = M.theme,
  }

  return modules[kind]
end

return M
