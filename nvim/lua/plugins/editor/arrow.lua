return {
  {
    "otavioschwanck/arrow.nvim",
    opts = {
      show_icons = true,
      leader_key = ";", -- Recommended to be a single key
    },
    config = function(_, opts)
      require("arrow").setup(opts)
    end,
  },
}
