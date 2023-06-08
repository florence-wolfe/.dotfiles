return {
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    keys = {
      { "w", "<cmd>lua require('spider').motion('w')<CR>", { "n", "o", "x" }, desc = "Spider-w" },
      { "e", "<cmd>lua require('spider').motion('e')<CR>", { "n", "o", "x" }, desc = "Spider-e" },
      { "b", "<cmd>lua require('spider').motion('b')<CR>", { "n", "o", "x" }, desc = "Spider-b" },
      { "ge", "<cmd>lua require('spider').motion('ge')<CR>", { "n", "o", "x" }, desc = "Spider-ge" },
    },
  },
}
