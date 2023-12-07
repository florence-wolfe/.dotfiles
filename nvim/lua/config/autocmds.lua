-- Set the filetype for certain files
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "extras.rc", "work.rc", "nas.rc" },
  group = vim.api.nvim_create_augroup("custom_file_types", {}),
  callback = function(ev)
    local file = ev.file
    if file:match("%.rc$") then
      vim.bo.filetype = "sh"
    end
  end,
})

-- Disable animations for certain filetypes
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "*" },
  group = vim.api.nvim_create_augroup("disable_animation", {}),
  callback = function()
    local filetype = vim.bo.filetype
    if filetype == "help" then
      vim.b.minianimate_disable = true
    else
      vim.b.minianimate_disable = false
    end
  end,
})

-- Remove LSP clients when closing buffers
--[[ vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    local buffer = vim.api.nvim_get_current_buf()
    vim.api.nvim_create_autocmd("BufDelete", {
      buffer = buffer,
      callback = function(opts)
        local bufnr = opts.buf
        local clients = vim.lsp.get_clients({ bufnr = bufnr })
        for client_id, _ in pairs(clients) do
          vim.lsp.buf_detach_client(bufnr, client_id)
        end
      end,
    })
  end,
}) ]]

-- https://github.com/hrsh7th/nvim-cmp/issues/519#issuecomment-1091109258
-- Only open completion menu when typing an there's a character before the cursor
--[[ vim.api.nvim_create_autocmd({ "TextChangedI", "TextChangedP" }, {
  callback = function()
    local line = vim.api.nvim_get_current_line()
    local cursor = vim.api.nvim_win_get_cursor(0)[2]

    local current = string.sub(line, cursor, cursor + 1)
    if current == "." or current == "," or current == " " then
      require("cmp").close()
    end

    local before_line = string.sub(line, 1, cursor + 1)
    local after_line = string.sub(line, cursor + 1, -1)
    if not string.match(before_line, "^%s+$") then
      if after_line == "" or string.match(before_line, " $") or string.match(before_line, "%.$") then
        require("cmp").complete()
      end
    end
  end,
  pattern = "*",
}) ]]
