local lspConf = require("utils.lsp-conf")

return {
  { "LnL7/vim-nix" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.prettierd)
      table.insert(opts.sources, nls.builtins.diagnostics.eslint_d)
      table.insert(opts.sources, nls.builtins.code_actions.eslint_d)
      table.insert(opts.sources, nls.builtins.code_actions.gitsigns)
      table.insert(opts.sources, nls.builtins.diagnostics.cspell)
      table.insert(opts.sources, nls.builtins.code_actions.cspell)
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
}
