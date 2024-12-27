return {
  {
    "utilyre/sentiment.nvim",
    event = "BufRead",
    config = function(_, opts)
      require("sentiment").setup(opts)
    end,
  },
}
