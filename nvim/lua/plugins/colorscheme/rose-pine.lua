return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      --- @usage 'auto'|'main'|'moon'|'dawn'
      variant = "moon",
      --- @usage 'main'|'moon'|'dawn'
      dark_variant = "moon",
      bold_vert_split = true,
      highlight_groups = {
        FloatBorder = { fg = "foam" },
        CmpItemAbbrMatchFuzzy = { fg = "rose" },
        CmpItemAbbrMatch = { fg = "rose" },
        MiniIndentscopeSymbol = { fg = "pine" },
      },
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
    end,
  },
}
