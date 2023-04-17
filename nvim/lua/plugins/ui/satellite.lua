return {
  {
    "lewis6991/satellite.nvim",
    event = "VeryLazy",
    opts = {
      winblend = 80, -- winblend = transparency
    },
    config = function(_, opts)
      require("satellite").setup(opts)
    end,
  },
}
