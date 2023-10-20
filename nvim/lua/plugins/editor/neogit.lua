return {
  {
    "NeogitOrg/neogit",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    keys = {
      {
        "<leader>gd",
        function()
          require("neogit").open({ kind = "floating" })
        end,
      },
    },
    opts = {
      disable_hint = true,
    },
    config = function(_, opts)
      require("neogit").setup(opts)
    end,
  },
}
