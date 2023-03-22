local M = {}

M.setup = {
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
}

M.servers = {
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
}

return M
