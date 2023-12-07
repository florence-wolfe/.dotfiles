return {
  {
    "folke/persistence.nvim",
    keys = {
      {
        "<leader>qs",
        function()
          require("persistence").load()
          vim.cmd("Neotree close")
        end,
        desc = "Restore Session",
      },
      {
        "<leader>ql",
        function()
          require("persistence").load({ last = true })
          vim.cmd("Neotree close")
        end,
        desc = "Restore Last Session",
      },
    },
    opts = {
      pre_save = function()
        vim.cmd("Neotree close")
      end,
    },
  },
}
