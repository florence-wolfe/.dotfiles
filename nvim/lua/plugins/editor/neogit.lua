return {
  {
    "NeogitOrg/neogit",
    enabled = true,
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    cmd = "Neogit",
    keys = {
      { "<Leader>gn", "<cmd>Neogit kind=auto<CR>", desc = "Neogit" },
    },
    opts = {
      disable_signs = false,
      disable_context_highlighting = false,
      disable_commit_confirmation = false,
      disable_hint = true,
      signs = {
        section = { ">", "v" },
        item = { ">", "v" },
        hunk = { "", "" },
      },
      integrations = {
        diffview = true,
      },
    },
    config = function(_, opts)
      require("neogit").setup(opts)
    end,
  },
}
