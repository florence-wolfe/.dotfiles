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
      vtsls = {
        settings = {
          typescript = {
            tsserver = {
              maxTsServerMemory = 16384,
            },
          },
        },
      },
    },
  },
}
