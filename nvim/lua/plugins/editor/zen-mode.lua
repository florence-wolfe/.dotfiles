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
    opts = {
      plugins = {
        -- this will change the font size on wezterm when in zen mode
        -- See alse also the Plugins/Wezterm section in this projects README
        gitsigns = { enabled = false }, -- disables git signs
        wezterm = {
          enabled = true,
          -- can be either an absolute font size or the number of incremental steps
          font = "+4", -- (10% increase per step)
        },
      },
    },
    config = function(_, opts)
      require("zen-mode").setup(opts)
    end,
  },
}
