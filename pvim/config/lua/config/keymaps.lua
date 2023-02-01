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
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>b]", "<cmd>bnext<cr>", { desc = "Next" })

local moveOpts = { noremap = true, silent = true }
vim.keymap.set("n", "<A-j>", "<cmd>MoveLine(1)<CR>", merge(moveOpts, { desc = "Line: move down (move.nvim)" }))
vim.keymap.set("n", "<A-Down>", "<cmd>MoveLine(1)<CR>", merge(moveOpts, { desc = "Line: move down (move.nvim)" }))
vim.keymap.set("n", "<A-k>", "<cmd>MoveLine(-1)<CR>", merge(moveOpts, { desc = "line: move up (move.nvim)" }))
vim.keymap.set("n", "<A-Up>", "<cmd>MoveLine(-1)<CR>", merge(moveOpts, { desc = "line: move up (move.nvim)" }))

-- Visual-mode commands
vim.keymap.set("v", "<A-j>", "<cmd>MoveBlock(1)<CR>", merge(moveOpts, { desc = "Block: move down (move.nvim)" }))
vim.keymap.set("v", "<A-Down>", "<cmd>MoveBlock(1)<CR>", merge(moveOpts, { desc = "Block: move down (move.nvim)" }))
vim.keymap.set("v", "<A-k>", "<cmd>MoveBlock(-1)<CR>", merge(moveOpts, { desc = "Block: move up (move.nvim)" }))
vim.keymap.set("v", "<A-Up>", "<cmd>MoveBlock(-1)<CR>", merge(moveOpts, { desc = "Block: move up (move.nvim)" }))
