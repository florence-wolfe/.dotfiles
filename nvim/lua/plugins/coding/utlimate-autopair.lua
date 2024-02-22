return {
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
      tabout = {
        enable = true,
        hopout = true,
      },
      bs = {
        indent_ignore = true,
      },
      fastwarp = { -- *ultimate-autopair-map-fastwarp-config*
        enable = true,
        enable_normal = true,
        enable_reverse = true,
        hopout = true,
      },
    },
    config = function(_, opts)
      require("ultimate-autopair").setup(opts)
    end,
  },
}
