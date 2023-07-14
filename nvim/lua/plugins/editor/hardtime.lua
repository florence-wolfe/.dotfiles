return {
  {
    "m4xshen/hardtime.nvim",
    enabled = false,
    opts = {
      disabled_filetypes = {
        "qf",
        "netrw",
        "NvimTree",
        "lazy",
        "mason",
        "neo-tree",
        "noice",
      },
      restricted_keys = {
        ["<C-P>"] = {},
      },
    },
    config = function(_, opts)
      require("hardtime").setup(opts)
    end,
  },
}
