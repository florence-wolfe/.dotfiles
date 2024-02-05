return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { { "biome", "prettierd", "prettier" } },
      typescript = { { "biome", "prettierd", "prettier" } },
      nix = { "nixfmt" },
      java = { "google-java-format" },
      python = { { "blackd-client" } },
    },
  },
}
