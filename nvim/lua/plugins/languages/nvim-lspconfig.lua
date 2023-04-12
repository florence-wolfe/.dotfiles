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
    },
    -- LSP Keymaps have to be modified in the init function
    -- https://www.lazyvim.org/plugins/lsp#%EF%B8%8F-customizing-lsp-keymaps
--[[     init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable line diagnostics
      keys[#keys + 1] = { "<leader>cd", false }
      -- disable goto definition
      keys[#keys + 1] = { "gd", false }
      -- disable goto references
      keys[#keys + 1] = { "gr", false }
      -- disable goto implementation
      keys[#keys + 1] = { "gI", false }
      -- disable goto type definition
      keys[#keys + 1] = { "gt", false }
      -- disable Hover
      keys[#keys + 1] = { "K", false }
      -- disable next diagnostic
      keys[#keys + 1] = { "]d", false }
      -- disable previous diagnostic
      keys[#keys + 1] = { "[d", false }
      -- disable next error
      keys[#keys + 1] = { "]e", false }
      -- disable previous error
      keys[#keys + 1] = { "[e", false }
      -- disable next warning
      keys[#keys + 1] = { "]w", false }
      -- disable previous warning
      keys[#keys + 1] = { "[w", false }
      -- disable code actions
      keys[#keys + 1] = { "<leader>ca", false }
    end, ]]
    opts = {
      servers = {
        pyright = {},
        tsserver = {
          settings = {
            completions = {
              completeFunctionCalls = true,
            },
          },
        },
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
              validate = { enable = true },
            },
          },
        },
      },
      setup = {
        tsserver = function(_, opts)
          require("lazyvim.util").on_attach(function(client, buffer)
            if client.name == "tsserver" then
        -- stylua: ignore
        vim.keymap.set("n", "<leader>co", "<cmd>TypescriptOrganizeImports<CR>",
          { buffer = buffer, desc = "Organize Imports" })
        -- stylua: ignore
        vim.keymap.set("n", "<leader>cR", "<cmd>TypescriptRenameFile<CR>",
          { desc = "Rename File", buffer = buffer })
            end
          end)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
  },
}
