return {
  {
    "ibhagwan/fzf-lua",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function(_, opts)
      return require("fzf-lua").setup(opts)
    end,
    opts = {
      "telescope",
      fzf_opts = {
        ["--layout"] = "reverse",
      },
    },
    keys = {
      {
        "<C-p>",
        function()
          require("fzf-lua").files()
        end,
        desc = "Find Files (cwd)",
      },
    },
  },
}
