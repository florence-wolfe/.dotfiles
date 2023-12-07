return {
  {
    "pmizio/typescript-tools.nvim",
    event = { "BufReadPost" },
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        tsserver_max_memory = 8192,
        tsserver_plugins = { "@astrojs/ts-plugin" },
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = true,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
          -- includeCompletionsForModuleExports = false,
        },
      },
    },
    config = function(_, opts)
      require("typescript-tools").setup(opts)
    end,
  },
}
