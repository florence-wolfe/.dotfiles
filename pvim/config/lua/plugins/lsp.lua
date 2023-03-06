return {
  { "LnL7/vim-nix" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        sources = {
          -- This seems to override the local prettier configs for formatting
          -- nls.builtins.formatting.prettierd,
          -- TODO: Renable if this can be set to global config
          -- https://github.com/jose-elias-alvarez/null-ls.nvim/pull/1412
          -- nls.builtins.diagnostics.cspell,
          -- nls.builtins.code_actions.cspell,
          -- nls.builtins.completion.spell,
          nls.builtins.code_actions.eslint_d,
          nls.builtins.code_actions.gitsigns,
          -- Nix Language
          nls.builtins.code_actions.statix,
          nls.builtins.diagnostics.deadnix,
          nls.builtins.formatting.nixfmt,
          --
          nls.builtins.code_actions.shellcheck,
          nls.builtins.diagnostics.shellcheck,
          nls.builtins.diagnostics.tsc,
          nls.builtins.diagnostics.vale,
        },
      }
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
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").on_attach(function(_, buffer)
          vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      servers = {
        pyright = {},
        tsserver = {},
      },
      setup = {
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "nil",
        "json-lsp",
        "lua-language-server",
        "prettierd",
        "pyright",
        "rnix-lsp",
        "typescript-language-server",
      },
    },
  },
}
