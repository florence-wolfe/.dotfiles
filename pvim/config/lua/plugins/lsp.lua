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
  -- {
  --   "jay-babu/mason-null-ls.nvim",
  --   opts = {
  --     automatic_setup = true,
  --     ensure_installed = {
  --       "actionlint",
  --       "eslint-lsp",
  --       "eslint_d",
  --       "flake8",
  --       "json-lsp",
  --       "lua-language-server",
  --       "nil",
  --       "prettier",
  --       "pyright",
  --       "rnix-lsp",
  --       "shellcheck",
  --       "shfmt",
  --       "stylua",
  --       "typescript-language-server",
  --       "vale",
  --       "yaml-language-server",
  --       "yamlfmt",
  --       "yamllint",
  --     },
  --   },
  --   init = function(_, opts)
  --     local null_ls = require("null-ls")
  --     require("mason-null-ls").setup(opts)
  --     require("mason-null-ls").setup_handlers({
  --       function(source_name, methods)
  --         -- all sources with no handler get passed here
  --
  --         -- To keep the original functionality of `automatic_setup = true`,
  --         -- please add the below.
  --         require("mason-null-ls.automatic_setup")(source_name, methods)
  --       end,
  --       eslint_d = function()
  --         null_ls.register(null_ls.builtins.diagnostics.eslint_d)
  --         null_ls.register(null_ls.builtins.code_actions.eslint_d)
  --       end,
  --     })
  --   end,
  -- },
}
