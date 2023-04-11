return {
  {
    "EdenEast/nightfox.nvim",
    opts = {
      styles = {
        comments = "italic",
        keywords = "bold",
        types = "italic,bold",
      },
      modules = {
        alpha = true,
        cmp = true,
        diagnsotic = {
          enable = true,
        },
        fidget = true,
        gitsigns = true,
        illumination = true,
        leap = {
          enable = true,
          harsh = true,
        },
        lsp_trouble = {
          enable = true,
        },
        mini = true,
        modes = true,
        native_lsp = true,
        navic = true,
        neotree = true,
        notify = true,
        symbol_outline = true,
        telescope = true,
        treesitter = true,
        tsrainbow2 = true,
        whichkey = true,
      },
    },
    config = function(_, opts)
      require("nightfox").setup(opts)
    end,
  },
}
