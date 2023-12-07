vim.keymap.set("n", "<Tab>", ">>")
vim.keymap.set("n", "<S-Tab>", "<<")
vim.keymap.set("n", ">", ">gv")
vim.keymap.set("v", "<Tab>", function()
  vim.cmd("normal! >gv")
end)
vim.keymap.set("v", "<S-Tab>", function()
  vim.cmd("normal! <gv")
end)
vim.keymap.set(
  "v",
  "<leader>s/",
  -- Yoink in to the z register then set the content as the starting point for grep_string with escaped characters (to handle spaces, etc. since grep_string is regexp)
  "zy<cmd>exec 'Telescope grep_string default_text=' . escape(@z, ' ')<cr>",
  { desc = "Grep string" }
)

vim.keymap.set("n", "<leader>bs", "<cmd>w<CR>", { desc = "Save buffer with formatting " })
vim.keymap.set("n", "[<Tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
vim.keymap.set("n", "[<S-Tab>", "<cmd>tabfirst<cr>", { desc = "First Tab" })
vim.keymap.set("n", "]<Tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "]<S-Tab>", "<cmd>tablast<cr>", { desc = "Last Tab" })
vim.keymap.set("n", "<M-m>", function()
  vim.ui.input({ prompt = "Marks" }, function(marks)
    vim.api.nvim_command("delmarks " .. marks)
  end)
end, { desc = "Remove marks" })

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
