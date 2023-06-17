return {
  {
    "dmmulroy/tsc.nvim",
    config = function(_, opts)
      require("tsc").setup(opts)
    end,
  },
}
