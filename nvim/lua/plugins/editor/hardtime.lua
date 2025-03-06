return {
  {
    "m4xshen/hardtime.nvim",
    enabled = true,
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
      },
    },
  },
}
