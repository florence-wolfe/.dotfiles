return {
  {
    "echasnovski/mini.splitjoin",
    enabled = false,
    config = function(_, opts)
      require("mini.splitjoin").setup(opts)
    end,
  },
}
