local lspConf = require("utils.lsp-conf")

return {
  { "LnL7/vim-nix" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.prettierd)
      table.insert(
        opts.sources,
        nls.builtins.diagnostics.eslint_d.with({
          method = nls.methods.DIAGNOSTICS_ON_SAVE,
        })
      )
      table.insert(opts.sources, nls.builtins.code_actions.eslint_d)
      table.insert(opts.sources, nls.builtins.code_actions.gitsigns)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    version = false,
    keys = {
      {
        "<leader>cL",
        "<cmd>LspRestart<cr>",
        desc = "Restart LSP",
      },
    },
    opts = {
      servers = lspConf.servers,
      setup = lspConf.setup,
    },
  },
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "actionlint",
      "eslint_d",
      "flake8",
      "json-lsp",
      "lua-language-server",
      "nil",
      "prettierd",
      "pyright",
      "rnix-lsp",
      "shellcheck",
      "shfmt",
      "stylua",
      "typescript-language-server",
      "vale",
      "yaml-language-server",
      "yamlfmt",
      "yamllint",
    },
  },
  {
    "github/copilot.vim",
    build = ":Copilot setup",
    event = "LspAttach",
    config = function()
      return "<cmd>Copilot enable<cr>"
    end,
  },
}
