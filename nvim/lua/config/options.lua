vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_picker = "fzf"
local python3_host_prog = vim.fn.expand("~") .. ".cde/lde/.vanilla-venv/bin/python"
print(python3_host_prog)
vim.g.python3_host_prog = python3_host_prog

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.list = true
vim.opt.listchars:append("space:·")
vim.opt.listchars:append("eol:¬")
vim.opt.fillchars:append("diff:/")
vim.opt.fillchars:append("foldclose:▸")
vim.opt.fillchars:append("foldopen:▾")
vim.opt.fillchars:append("foldsep:│")
vim.opt.fillchars:append("fold: ")
vim.opt.foldcolumn = "1" -- '0' is not bad
vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.mousemoveevent = true
vim.opt.showtabline = 2
vim.opt.updatetime = 200
vim.opt.scrolloff = 9999
vim.opt.timeoutlen = 1000
