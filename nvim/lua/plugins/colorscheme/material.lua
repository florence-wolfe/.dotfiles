return {
  {
    "marko-cerovac/material.nvim",
    opts = {
      plugins = {
        "gitsigns",
        "mini",
        "nvim-cmp",
        "nvim-navic",
        "nvim-web-devicons",
        "telescope",
        "trouble",
        "which-key",
      },
    },
    config = function(_, opts)
      vim.g.material_style = "deep ocean"
      require("material").setup(opts)
    end,
  },
}
