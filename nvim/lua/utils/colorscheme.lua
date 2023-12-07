local themes = {
  MATERIAL = "material",
  CATPPUCCIN = "catppuccin",
  TOKYONIGHT = "tokyonight",
  ROSE_PINE = "rose-pine",
}

local M = {}

local path = (vim.fn.stdpath("config") .. "/lua/utils/.theme")
local function read_theme()
  local ok, file = pcall(vim.fn.readfile, path)
  if ok then
    return file[1]
  else
    return nil
  end
end
local function restore()
  local theme = read_theme()
  if theme then
    M.theme = theme
    vim.cmd.colorscheme(theme)
  else
    return nil
  end
end
M.write_theme = function(theme)
  vim.fn.writefile({ theme }, path, "s")
end
local timer = vim.loop.new_timer()
timer:start(200, 0, vim.schedule_wrap(restore))

print("Default Starter Theme: " .. tostring(M.theme))
M.lualine = M.theme
M.barbecue = M.theme
M.lazyvim = M.theme

M.get_colors = function()
  if M.theme == themes.CATPPUCCIN then
    return require("catppuccin.palettes").get_palette()
  end
end

---@return table<string, BufferlineHLGroup>
M.bufferline = function()
  if M.theme == themes.CATPPUCCIN then
    return require("catppuccin.groups.integrations.bufferline").get()
  elseif M.theme == themes.ROSE_PINE then
    return require("rose-pine.plugins.bufferline")
  end
end

M.hydra_lualine = function()
  local C = require("catppuccin.palettes").get_palette()
  return { bg = C.maroon, fg = C.surface0, gui = "bold" }
end

M.winsep = function()
  if M.theme == themes.CATPPUCCIN then
    -- local C = require("catppuccin.palettes").get_palette()
    return {}
  elseif M.theme == "tokyonight" then
    local T = require("tokyonight.colors").setup({ transform = true })
    return {
      fg = T.bg,
      bg = T.bg,
    }
  elseif M.theme == themes.ROSE_PINE then
    local R = require("rose-pine.palette")
    return {
      fg = R.muted,
    }
  end
end

M.modicator_mode = function()
  if M.theme == themes.CATPPUCCIN then
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
  elseif M.theme == themes.TOKYONIGHT then
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
  elseif M.theme == themes.ROSE_PINE then
    local R = require("rose-pine.palette")
    return {
      ["n"] = {
        foreground = R.rose,
      },
      ["i"] = {
        foreground = R.foam,
      },
      ["v"] = {
        foreground = R.iris,
      },
      ["V"] = {
        foreground = R.iris,
      },
      ["\22"] = {
        foreground = R.iris,
      },
      ["s"] = {
        foreground = R.iris,
      },
      ["S"] = {
        foreground = R.iris,
      },
      ["R"] = {
        foreground = R.pine,
      },
      ["c"] = {
        foreground = R.love,
      },
      ["t"] = {
        foreground = R.rose,
      },
    }
  end
end

M.toggleterm = function()
  if M.theme == themes.ROSE_PINE then
    return require("rose-pine.plugins.toggleterm")
  end

  return {}
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
  --- @field winsep { highlight: { fg: string, bg: string } }
  --- @field toggleterm table<string, string>
  --- @field theme string
  --- @field colors table<string, string>
  local modules = {
    ["colors"] = M.get_colors(),
    ["lualine"] = M.lualine,
    ["barbecue"] = M.barbecue,
    ["lazyvim"] = M.lazyvim,
    ["bufferline"] = M.bufferline(),
    ["modicator_mode"] = M.modicator_mode(),
    ["winsep"] = M.winsep(),
    ["toggleterm"] = M.toggleterm(),
    ["theme"] = M.theme,
    ["hydra_lualine"] = M.hydra_lualine(),
  }

  return modules[kind]
end

vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  group = vim.api.nvim_create_augroup("MyColorSchemeAutocmd", {}),
  callback = function()
    local prev_theme = vim.g.colors_name or vim.api.nvim_exec("colorscheme", true)
    if vim.g.colors_name == "default" then
      return -- Do nothing if the colorscheme is 'default'
    end
    M.write_theme(prev_theme)
  end,
})

return M
