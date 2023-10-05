return {
  "ckolkey/ts-node-action",
  enabled = false,
  dependencies = { "nvim-treesitter" },
  config = function(_, opts)
    require("ts-node-action").setup(opts)
  end,
}
