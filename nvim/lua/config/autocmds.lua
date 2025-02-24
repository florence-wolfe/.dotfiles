-- Set the filetype for certain files
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.rc", ".envrc", "simbo.sh" },
  group = vim.api.nvim_create_augroup("custom_file_types", {}),
  callback = function(ev)
    local file = ev.file
    if file:match("%.rc$") or file:match("%.envrc$") then
      vim.bo.filetype = "zsh"
    elseif file:match("simbo.sh$") then
      vim.bo.filetype = "python"
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
