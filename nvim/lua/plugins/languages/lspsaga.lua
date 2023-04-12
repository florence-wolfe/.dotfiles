local colorscheme = require("utils.colorscheme")

return {
  {
    "glepnir/lspsaga.nvim",
    enabled = false,
    event = "LspAttach",
    opts = {
      symbol_in_winbar = {
        enable = true,
      },
      lightbulb = {
        enable_in_insert = false,
      },
      ui = {
        kind = colorscheme.get("lspsaga"),
      },
    },
    config = function(_, opts, ooooo)
      require("lspsaga").setup(opts)
    end,
    keys = {
      { "gh", "<cmd>Lspsaga lsp_finder<CR>", mode = "n", desc = "LSP finder" },
      { "<leader>ca", "<cmd>Lspsaga code_action<CR>", mode = { "n", "v" }, desc = "Code action" },
      { "gr", "<cmd>Lspsaga rename<CR>", mode = "n", desc = "Rename" },
      { "gr", "<cmd>Lspsaga rename ++project<CR>", mode = "n", desc = "Rename (project)" },
      { "gp", "<cmd>Lspsaga peek_definition<CR>", mode = "n", desc = "Peek definition" },
      { "gd", "<cmd>Lspsaga goto_definition<CR>", mode = "n", desc = "Go to definition" },
      { "gt", "<cmd>Lspsaga peek_type_definition<CR>", mode = "n", desc = "Peek type definition" },
      { "gt", "<cmd>Lspsaga goto_type_definition<CR>", mode = "n", desc = "Go to type definition" },
      { "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", mode = "n", desc = "Show line diagnostics" },
      { "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", mode = "n", desc = "Show buffer diagnostics" },
      { "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", mode = "n", desc = "Show workspace diagnostics" },
      { "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", mode = "n", desc = "Show cursor diagnostics" },
      { "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", mode = "n", desc = "Prev Diagnostic" },
      { "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", mode = "n", desc = "Next Diagnostic" },
      {
        "[e",
        function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end,
        mode = "n",
        desc = "Prev Error",
      },
      {
        "]e",
        function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
        end,
        mode = "n",
        desc = "Next Error",
      },
      {
        "[w",
        function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.WARN })
        end,
        mode = "n",
        desc = "Prev Warning",
      },
      {
        "]w",
        function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.WARN })
        end,
        mode = "n",
        desc = "Next Warning",
      },
      { "K", "<cmd>Lspsaga hover_doc<CR>", mode = "n", desc = "Hover doc" },
      { "K", "<cmd>Lspsaga hover_doc ++keep<CR>", mode = "n", desc = "Hover doc (keep)" },
      { "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", mode = "n", desc = "Call hierarchy (incoming)" },
      { "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", mode = "n", desc = "Call hierarchy (outgoing)" },
    },
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
}
