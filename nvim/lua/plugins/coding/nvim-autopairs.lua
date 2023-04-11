return {
  {
    "windwp/nvim-autopairs",
    opts = {
      check_ts = true,
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
    end,
  },
}
