return {
  {
    -- https://github.com/SmiteshP/nvim-navbuddy
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      {
        "<leader>cn",
        function()
          require("nvim-navbuddy").open()
        end,
        desc = "Navbuddy",
      },
    },
    opts = {
      lsp = {
        auto_attach = true,
      },
      window = {
        position = "100%",
      },
    },
    init = function(_, opts)
      require("nvim-navbuddy").setup(opts)
    end,
  },
}
