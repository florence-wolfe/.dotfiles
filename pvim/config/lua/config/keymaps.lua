-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>b]", "<cmd>bnext<cr>", { desc = "Next" })
vim.keymap.set("n", "<leader>\\", function()
  require("lazyvim.util").float_term()
end, { desc = "Terminal (cwd) (alias <leader>fT)" })
vim.keymap.set("n", "<leader>\\g", function()
  require("lazyvim.util").float_term({ "lazygit" })
end, { desc = "Lazygit (cwd) (alias <leader>gg)" })
