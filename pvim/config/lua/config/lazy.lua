local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- import LazyVim plugins
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins"
    },

    -- import/override with your plugins
    { import = "plugins" },
    { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- use mini.starter instead of alpha
    { import = "lazyvim.plugins.extras.ui.mini-starter" },
    -- add jsonls and schemastore ans setup treesitter for json, json5 and jsonc
    { import = "lazyvim.plugins.extras.lang.json" },
    -- import any extras modules here
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
  },
  defaults = {
    lazy = true, -- every plugin is lazy-loaded by default
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
})
