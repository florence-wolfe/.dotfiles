return {
  {
    "folke/zen-mode.nvim",
    dependencies = {
      "folke/twilight.nvim",
    },
    keys = {
      {
        "<leader>Z",
        "<cmd>ZenMode<cr>",
        desc = "Toggle ZenMode",
      },
    },
    config = function()
      require("zen-mode").setup()
    end,
  },
}
