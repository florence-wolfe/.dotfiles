return {
  "neovim/nvim-lspconfig",
  keys = {
    {
      "<leader>cL",
      "<cmd>LspRestart<cr>",
      desc = "Restart LSP",
    },
    {
      "<C-K>",
      function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end,
      { "inoremap" },
      { "n", "i" },
      desc = "Toggle LSP Inlay Hints",
    },
  },
  opts = {
    servers = {
      lua_ls = {
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          },
        },
        diagnostics = {
          -- Recognize the `vim` global
          globals = { "vim" },
        },
      },
      vtsls = {
        settings = {
          typescript = {
            tsserver = {
              maxTsServerMemory = 16384,
            },
          },
        },
      },
      basedpyright = {
        settings = {
          basedpyright = {
            analysis = {
              diagnosticMode = "openFilesOnly",
              logLevel = "Error",
              inlayHints = {
                variableTypes = false,
                callArgumentNames = false,
                functionReturnTypes = false,
              }
            },
            disableTaggedHints = true,
          },
        },
      },
    },
  },
}
