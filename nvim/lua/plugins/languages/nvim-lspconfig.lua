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
          vim.lsp.buf.inlay_hint(bufnr, nil)
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
    end,
    opts = {
      servers = {
        tailwindcss = {
          filetypes_exclude = { "markdown" },
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
