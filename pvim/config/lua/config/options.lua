vim.opt.relativenumber = false
vim.opt.list = true
vim.opt.listchars:append("space:·")
vim.opt.listchars:append("eol:¬")
vim.opt.fillchars:append("diff:/")
-- write no format
vim.api.nvim_create_user_command("Wnf", "noa w", {})
vim.opt.foldcolumn = "1" -- '0' is not bad
vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.mousemoveevent = true
vim.opt.showtabline = 2
vim.opt.spell = true
vim.opt.spellfile = vim.fn.expand("~/.dotfiles/pvim/config/en.add")
vim.opt.updatetime = 200
vim.opt.scrolloff = 12
