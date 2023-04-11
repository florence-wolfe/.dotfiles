return {
  {
    "utilyre/sentiment.nvim",
    config = function(_, opts)
      require("sentiment").setup(opts)
    end,
  },
}
