return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { { "prettierd", "prettier" } },
      typescript = { { "prettierd", "prettier" } },
      nix = { "nixfmt" },
      java = { "google-java-format" },
      python = { { "blackd-client" } },
    },
  },
}
