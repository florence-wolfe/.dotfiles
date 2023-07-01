return {
  {
    "tzachar/highlight-undo.nvim",
    config = function(_, opts)
      require("highlight-undo").setup(opts)
    end,
  },
}
