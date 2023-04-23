local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

local function generate_import_entries(path)
  local entries = {}

  -- get the Neovim configuration directory
  local config_dir = vim.fn.stdpath("config")

  -- resolve the relative path
  local resolved_path = config_dir .. "/" .. path

  -- normalize the input path
  local normalized_path = vim.fn.fnamemodify(resolved_path, ":p")

  -- extract the relevant path and replace forward slashes with dots, and remove leading 'lua/'
  local function format_path(p)
    -- extract the relevant path, e.g., 'lua/plugins/coding' from the absolute path
    local relevant_path = p:match(".*/(lua/plugins/.*)")
    return relevant_path:gsub("/", "."):gsub("^lua%.", ""):gsub("%.+", ".")
  end
  -- iterate over the directories in the given path
  local dirs = vim.fn.glob(normalized_path .. "/*", 1, 1)
  for i = 1, #dirs do
    local dir = dirs[i]
    if vim.fn.isdirectory(dir) == 1 then
      local import_path = format_path(dir)
      table.insert(entries, { import = import_path })
    end
  end

  return entries
end

local path = "lua/plugins"
local import_entries = generate_import_entries(path)
---@type LazyConfig
local config = {
  spec = {
    -- import LazyVim plugins
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
    },

    -- import/override with your plugins
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- use mini.starter instead of alpha
    -- { import = "lazyvim.plugins.extras.ui.mini-starter" },
    -- add jsonls and schemastore ans setup treesitter for json, json5 and jsonc
    { import = "lazyvim.plugins.extras.lang.json" },
    -- import any extras modules here
    { import = "lazyvim.plugins.extras.lang.typescript" },
  },
  ui = {
    border = "rounded",
  },
  defaults = {
    lazy = false, -- every plugin is lazy-loaded by default
    version = false, -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "cattpuccin", "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}

for _, entry in ipairs(import_entries) do
  table.insert(config.spec, entry)
end

require("lazy").setup(config)
