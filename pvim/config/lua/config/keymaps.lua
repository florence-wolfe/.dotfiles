vim.keymap.set({ "n", "v" }, "<Tab>", ">>", { desc = "Indent line" })
vim.keymap.set({ "n", "v" }, "<S-Tab>", "<<", { desc = "Outdent line" })
vim.keymap.set("i", "<S-Tab>", "<C-d>", { desc = "Outdent line" })
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

vim.keymap.set("n", "/", "<cmd>SearchBoxIncSearch visual_mode=false show_matches=true<CR>", { desc = "Search" })
vim.keymap.set("x", "/", "<cmd>SearchBoxIncSearch visual_mode=true show_matches=true<CR>", { desc = "Search" })
vim.keymap.set(
  "n",
  "?",
  "<cmd>SearchBoxIncSearch visual_mode=false show_matches=true reverse=true<CR>",
  { desc = "Search" }
)
vim.keymap.set(
  "x",
  "?",
  "<cmd>SearchBoxIncSearch visual_mode=true show_matches=true reverse=true<CR>",
  { desc = "Search" }
)
vim.keymap.set(
  "n",
  "<leader>r",
  "<cmd>SearchBoxReplace confirm=menu visual_mode=false show_matches=true<CR>",
  { desc = "Search & Replace buffer" }
)
vim.keymap.set(
  "x",
  "<leader>r",
  "<cmd>SearchBoxReplace confirm=menu visual_mode=true show_matches=true<CR>",
  { desc = "Search & Replace selection" }
)

vim.keymap.set("n", "<M-m>", function()
  vim.ui.input({ prompt = "Marks" }, function(marks)
    vim.api.nvim_command("delmarks " .. marks)
  end)
end, { desc = "Remove marks" })
