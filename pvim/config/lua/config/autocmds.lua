-- Open files and buffers unfolded
vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost" }, {
  group = vim.api.nvim_create_augroup("open_folds", { clear = true }),
  pattern = "*",
  command = "normal zR",
})
