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
  { noremap = true, desc = "Replace all occurrences of selected text" }
)
vim.keymap.set("n", "<leader>bs", "<cmd>w<CR>", { desc = "Save buffer with formatting " })
vim.keymap.set("n", "<leader>bn", "<cmd>Wnf<CR>", { desc = "Save buffer without formatting " })
