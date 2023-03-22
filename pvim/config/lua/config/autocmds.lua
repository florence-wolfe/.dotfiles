vim.api.nvim_create_autocmd({
  "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
  "BufWinEnter",
  "CursorHold",
  "InsertLeave",

  -- include these if you have set `show_modified` to `true`
  "BufWritePost",
  "TextChanged",
  "TextChangedI",
}, {
  group = vim.api.nvim_create_augroup("barbecue.updater", {}),
  callback = function()
    require("barbecue.ui").update()
  end,
})

-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function()
--     if vim.lsp.buf.server_ready() then
--       vim.lsp.buf.format({ timeout_ms = 2000 })
--     end
--   end,
-- })
