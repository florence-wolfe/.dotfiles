return {
  {
    "mvllow/modes.nvim",
    enabled = false,
    opts = {},
    config = function(_, opts)
      require("modes").setup(opts)
    end,
  },
}
