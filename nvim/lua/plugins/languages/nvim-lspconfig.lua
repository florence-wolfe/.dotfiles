return {
  {
    "neovim/nvim-lspconfig",
    version = false,
    keys = {
      {
        "<leader>cL",
        "<cmd>LspRestart<cr>",
        desc = "Restart LSP",
      },
      {
        "<C-K>",
        function()
          local bufnr = vim.api.nvim_get_current_buf()
          local success, is_enabled = pcall(vim.lsp.inlay_hint.is_enabled, bufnr)
          local show_inlay
          if not success then
            show_inlay = nil
          else
            show_inlay = not is_enabled
          end
          vim.lsp.inlay_hint.enable(bufnr, show_inlay)
        end,
        { "inoremap" },
        { "n", "i" },
        desc = "Toggle LSP Inlay Hints",
      },
    },
    -- LSP Keymaps have to be modified in the init function
    -- https://www.lazyvim.org/plugins/lsp#%EF%B8%8F-customizing-lsp-keymaps
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable Hover
      keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = { "<leader>ca", false }
    end,
    opts = {
      servers = {
        tailwindcss = {
          filetypes_exclude = { "markdown" },
        },
        astro = {
          typescript = {
            inlayHints = {
              parameterNames = {
                enabled = "all",
              },
              parameterTypes = {
                enabled = "all",
              },
            },
          },
        },
        pylsp = {
          plugins = {
            pycodestyle = {
              ignore = { "E501" },
              maxLineLength = 88,
            },
          },
        },
        lua_ls = { settings = { Lua = { hint = { enable = true } } } },
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
        ruff_lsp = {
          keys = {
            {
              "<leader>co",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.organizeImports" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Organize Imports",
            },
          },
        },
      },
      setup = {
        tailwindcss = function(_, opts)
          local tw = require("lspconfig.server_configurations.tailwindcss")
          --- @param ft string
          opts.filetypes = vim.tbl_filter(function(ft)
            return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
          end, tw.default_config.filetypes)
        end,
      },
    },
  },
}
