require("nvim-treesitter.configs").setup({
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = false },
  context_commentstring = { enable = true, enable_autocmd = false },
})
