return {
  {
    "winston0410/range-highlight.nvim",
    dependencies = {
      { "winston0410/cmd-parser.nvim" },
    },
    config = function(_, opts)
      require("range-highlight").setup(opts)
    end,
  },
}
