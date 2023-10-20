-- In normal mode, indent and outdent line then remain in normal mode
vim.keymap.set("n", "<Tab>", ">>_", { noremap = true, silent = true, desc = "Indent line" })
vim.keymap.set("n", "<S-Tab>", "<<_", { noremap = true, silent = true, desc = "Outdent line" })

-- In visual mode, indent/outdent selection and then stay in visual mode
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true, desc = "Indent line" })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true, desc = "Outdent line" })

-- In insert mode, outdent line
vim.keymap.set("i", "<S-Tab>", "<C-d>", { noremap = true, silent = true, desc = "Outdent line" })

vim.keymap.set(
  "v",
  "<leader>s/",
  -- Yoink in to the z register then set the content as the starting point for grep_string with escaped characters (to handle spaces, etc. since grep_string is regexp)
  "zy<cmd>exec 'Telescope grep_string default_text=' . escape(@z, ' ')<cr>",
  { desc = "Grep string" }
)

vim.keymap.set("n", "<leader>bs", "<cmd>w<CR>", { desc = "Save buffer with formatting " })
vim.keymap.set("n", "<leader>bn", "<cmd>Wnf<CR>", { desc = "Save buffer without formatting " })
vim.keymap.set("n", "<leader>xM", function()
  -- Open a new split window for the output buffer
  vim.cmd("new")

  -- Redirect the output to the current buffer
  vim.cmd("redir @a")
  vim.cmd("silent verbose map")
  vim.cmd("redir END")

  -- Paste the captured output into the buffer
  vim.api.nvim_put({ vim.fn.getreg("a") }, "b", true, true)
  vim.cmd("normal! gg")
end, { desc = "Print all keybindings" })
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

-- https://www.reddit.com/r/neovim/comments/13y3thq/whats_a_very_simple_config_change_that_you_cant/
vim.keymap.set("i", "<C-BS>", "<Esc>cvb", { desc = "Delete entire words behind cursor" })
vim.keymap.set("x", "y", "ygv<Esc>", { desc = "Keep cursor in position when copying text" })
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })
