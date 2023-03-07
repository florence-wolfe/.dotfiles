vim.opt.relativenumber = false
vim.opt.list = true
vim.opt.listchars:append("space:·")
vim.opt.listchars:append("eol:¬")
vim.opt.fillchars:append("diff:/")
-- write no format
vim.api.nvim_create_user_command("Wnf", "noa w", {})
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.mousemoveevent = true
vim.opt.showtabline = 2
