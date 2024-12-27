return {
  {
    "nvim-zh/colorful-winsep.nvim",
    enabled = true,
    opts = {},
    config = function(_, opts)
      require("colorful-winsep").setup(opts)
    end,
    event = { "WinNew" },
  },
}
