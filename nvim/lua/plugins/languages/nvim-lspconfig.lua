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
      jsonls = {
        -- lazy-load schemastore when needed
        on_new_config = function(new_config)
          new_config.settings.json.schemas = new_config.settings.json.schemas or {}
          vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
        end,
        settings = {
          json = {
            format = {
              enable = true,
            },
            validate = {
              enable = true,
            },
          },
        },
      },
      lua_ls = {
        settings = {
          Lua = { hint = { enable = true } },
        },
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
              },
            },
            disableTaggedHints = true,
          },
        },
      },
    },
  },
}
