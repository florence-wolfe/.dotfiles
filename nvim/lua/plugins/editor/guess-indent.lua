return {
  {
    "nmac427/guess-indent.nvim",
    enabled = false,
    config = function(_, opts)
      require("guess-indent").setup(opts)
    end,
  },
}
