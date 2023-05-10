return {
  {
    "echasnovski/mini.hues",
    enabled = false,
    opts = {
      background = "#282b36",
      foreground = "#b488f4",
      saturation = "high",
    },
    config = function(_, opts)
      require("mini.hues").setup(opts)
    end,
  },
}
