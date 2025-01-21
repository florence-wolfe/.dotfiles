return {
  {
    "ibhagwan/fzf-lua",
    enabled = false,
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/trouble.nvim" },
    config = function(_, opts)
      return require("fzf-lua").setup(opts)
    end,
    opts = function(_, opts)
      local trouble_sources = require("trouble.sources.fzf")

      return {
        "telescope",
        fzf_opts = {
          ["--layout"] = "reverse",
        },
        actions = {
          files = {
            ["ctrl-t"] = trouble_sources.actions.open,
            ["ctrl-q"] = trouble_sources.actions.open_selected,
          },
        },
      }
    end,
    keys = {
      {
        "<C-p>",
        function()
          require("fzf-lua").files()
        end,
        desc = "Find Files (cwd)",
      },
      --[[ {
        '<leader>"',
        function()
          require("fzf-lua").resume()
        end,
        desc = "Resume FzF Picker",
      }, ]]
    },
  },
}
