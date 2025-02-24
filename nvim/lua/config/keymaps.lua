vim.keymap.set("n", "<Tab>", ">>", { noremap = true })
vim.keymap.set("n", "<S-Tab>", "<<", { noremap = true })

-- Visual mode: Tab/Shift-Tab for indent/dedent (preserving selection)
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true })

-- Insert mode: Shift-Tab for dedent
vim.keymap.set("i", "<S-Tab>", "<C-d>", { noremap = true })

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
