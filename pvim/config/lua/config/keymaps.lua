local function merge(...)
  local result = {}
  for _, t in ipairs({ ... }) do
    for k, v in pairs(t) do
      result[k] = v
    end
    local mt = getmetatable(t)
    if mt then
      setmetatable(result, mt)
    end
  end
  return result
end

vim.keymap.set("n", "<Tab>", ">>", { desc = "Indent line" })
vim.keymap.set("n", "<S-Tab>", "<<", { desc = "Outdent line" })
vim.keymap.set("i", "<S-Tab>", "<C-d>", { desc = "Outdent line" })
vim.keymap.set(
  "v",
  "<C-r>",
  '"hy:%s/<C-r>h//gc<left><left><left>',
  { noremap = true, desc = "Replace all occurrences in buffer" }
)

vim.keymap.set(
  "v",
  "<leader>s/",
  -- Yoink in to the z register then set the content as the starting point for grep_string with escaped characters (to handle spaces, etc. since grep_string is regexp)
  "zy<cmd>exec 'Telescope grep_string default_text=' . escape(@z, ' ')<cr>",
  { desc = "Grep string" }
)

vim.keymap.set("n", "<leader>bs", "<cmd>w<CR>", { desc = "Save buffer with formatting " })
vim.keymap.set("n", "<leader>bn", "<cmd>Wnf<CR>", { desc = "Save buffer without formatting " })
vim.keymap.set("n", "<leader>p", function()
  local win = vim.api.nvim_get_current_win()
  vim.ui.input({ prompt = "Line Count" }, function(lines)
    local count = tonumber(lines)
    if count then
      local cmd
      local target_line
      local current_line = vim.api.nvim_win_get_cursor(win)[1]
      if count >= 1 then
        cmd = "put"
        target_line = current_line + count - 1
      else
        cmd = "put!"
        target_line = current_line + count + 1
      end
      vim.api.nvim_command(target_line .. cmd .. ' "' .. vim.fn.getreg('"') .. '"')
      vim.api.nvim_win_set_cursor(0, { target_line, 0 })
    else
      print("Invalid line count")
    end
  end)
end, { desc = "Put register n lines" })

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
