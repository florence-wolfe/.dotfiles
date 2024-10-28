-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false
vim.opt.list = true
vim.opt.listchars:append("space:·")
vim.opt.listchars:append("eol:¬")
vim.opt.fillchars:append("diff:/")
vim.opt.fillchars:append("foldclose:▸")
vim.opt.fillchars:append("foldopen:▾")
vim.opt.fillchars:append("foldsep:│")
vim.opt.fillchars:append("fold: ")

