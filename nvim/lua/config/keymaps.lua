-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<Tab>", ">>")
vim.keymap.set("n", "<S-Tab>", "<<")
vim.keymap.set("n", ">", ">gv")
vim.keymap.set("v", "<Tab>", function()
  vim.cmd("normal! >gv")
end)
vim.keymap.set("v", "<S-Tab>", function()
  vim.cmd("normal! <gv")
end)
vim.keymap.set("i", "<S-Tab>", "<C-d>")
vim.keymap.set("n", "<leader>bs", "<cmd>w<CR>", { desc = "Save buffer with formatting" })
-- write no format
vim.api.nvim_create_user_command("Wnf", "noa w", {})
vim.keymap.set("n", "<leader>bn", "<cmd>Wnf<CR>", { desc = "Save buffer without formatting" })
vim.keymap.set("n", "<left>", function()
  local cur_line = vim.api.nvim_win_get_cursor(0)[1]
  if vim.fn.foldclosed(cur_line) == -1 then
    vim.cmd("normal! h")
  end
end, { desc = "Check for fold before moving left" })

vim.keymap.set("n", "<right>", function()
  local cur_line = vim.api.nvim_win_get_cursor(0)[1]
  if vim.fn.foldclosed(cur_line) == -1 then
    vim.cmd("normal! l")
  end
end, { desc = "Check for fold before moving right" })

vim.keymap.set("i", "<C-BS>", "<C-W>", { desc = "Delete previous word in insert mode" })
vim.keymap.set("x", "y", "ygv<Esc>", { desc = "Keep cursor in position when copying text" })
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })
vim.keymap.set("n", "<C-Right>", "w", { desc = "Move forward a word in normal mode" })
vim.keymap.set("i", "<C-Right>", "<Esc>wi", { desc = "Move forward a word in insert mode" })
vim.keymap.set("n", "<C-Left>", "b", { desc = "Move backward a word in normal mode" })
vim.keymap.set("i", "<C-Left>", "<Esc>bi", { desc = "Move backward a word in insert mode" })

-- Move lines with arrow keys
vim.keymap.set("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-Up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
