return {
  {
    "m4xshen/hardtime.nvim",
    enabled = true,
    keys = {
      { "gw", false },
    },
    opts = {
      disabled_filetypes = {
        "NvimTree",
      },
      disable_mouse = false,
      restricted_keys = {
        ["<C-P>"] = {},
      },
      disabled_keys = {
        ["<Up>"] = {},
        ["<Down>"] = {},
        ["<Left>"] = {},
        ["<Right>"] = {},
        ["gw"] = {},
      },
    },
    config = function(_, opts)
      require("hardtime").setup(opts)
    end,
  },
}
