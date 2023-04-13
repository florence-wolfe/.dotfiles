local colorscheme = require("utils.colorscheme")
local utils = require("utils")

return {
  {
    "glepnir/lspsaga.nvim",
    enabled = false,
    event = "LspAttach",
    opts = {
      symbol_in_winbar = {
        enable = false,
        show_file = false,
      },
      finder = {
        scroll_down = "<C-f>",
        scroll_up = "<C-b>", -- quit can be a table
        quit = { "q", "<ESC>" },
      },
      lightbulb = {
        virtual_text = false,
        enable_in_insert = false,
      },
      ui = {
        kind = colorscheme.get("lspsaga"),
      },
    },
    config = function(_, opts)
      utils.create_keymap_group("<leader>cd", "+diagnostics")
      require("lspsaga").setup(opts)
    end,
    keys = {
      { "gh", "<cmd>Lspsaga lsp_finder<CR>", desc = "LSP finder" },
      { "<leader>ca", "<cmd>Lspsaga code_action<CR>", mode = { "n", "v" }, desc = "Code action" },
      { "gr", "<cmd>Lspsaga rename<CR>", desc = "Rename" },
      { "gr", "<cmd>Lspsaga rename ++project<CR>", desc = "Rename (project)" },
      { "gp", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek definition" },
      { "gd", "<cmd>Lspsaga goto_definition<CR>", desc = "Go to definition" },
      { "gt", "<cmd>Lspsaga peek_type_definition<CR>", desc = "Peek type definition" },
      { "gt", "<cmd>Lspsaga goto_type_definition<CR>", desc = "Go to type definition" },
      { "<leader>cdl", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show line diagnostics" },
      { "<leader>cdb", "<cmd>Lspsaga show_buf_diagnostics<CR>", desc = "Show buffer diagnostics" },
      { "<leader>cdw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", desc = "Show workspace diagnostics" },
      { "<leader>cdc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", desc = "Show cursor diagnostics" },
      { "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Prev Diagnostic" },
      { "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next Diagnostic" },
      {
        "[e",
        function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end,
        desc = "Prev Error",
      },
      {
        "]e",
        function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
        end,
        desc = "Next Error",
      },
      {
        "[w",
        function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.WARN })
        end,
        desc = "Prev Warning",
      },
      {
        "]w",
        function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.WARN })
        end,
        desc = "Next Warning",
      },
      { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover doc" },
      { "K", "<cmd>Lspsaga hover_doc ++keep<CR>", desc = "Hover doc (keep)" },
      { "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", desc = "Call hierarchy (incoming)" },
      { "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", desc = "Call hierarchy (outgoing)" },
    },
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
}
