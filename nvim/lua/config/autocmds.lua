--[[ -- Set the filetype for certain files
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "extras.rc", "work.rc" },
  group = vim.api.nvim_create_augroup("custom_file_types", {}),
  callback = function(ev)
    local file = ev.file
    if file:match("%.rc$") then
      vim.bo.filetype = "sh"
    end
  end,
})

-- Update the bufferline when certain events occur
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

-- Remove LSP clients when closing buffers
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.api.nvim_create_autocmd("BufDelete", {
      buffer = vim.api.nvim_get_current_buf(),
      callback = function(opts)
        local bufnr = opts.buf
        local clients = vim.lsp.buf_get_clients(bufnr)
        for client_id, _ in pairs(clients) do
          vim.lsp.buf_detach_client(bufnr, client_id)
        end
      end,
    })
  end,
}) ]]
