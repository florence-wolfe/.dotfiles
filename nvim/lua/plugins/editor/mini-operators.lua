return {
  {
    "echasnovski/mini.operators",
    enabled = false,
    config = function(_, opts)
      require("mini.operators").setup(opts)
    end,
  },
}
