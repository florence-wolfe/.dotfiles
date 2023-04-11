local utils = require("utils")

return {
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {
      snippet_engine = "luasnip",
    },
    init = function()
      utils.create_keymap_group("<leader>cN", "+neogen")
    end,
    config = function(_, opts)
      require("neogen").setup(opts)
    end,
    keys = {
      {
        "<leader>cNf",
        function()
          require("neogen").generate({ type = "func" })
        end,
        mode = { "n", "v" },
        desc = "Annotate function",
      },
      {
        "<leader>cNF",
        function()
          require("neogen").generate({ type = "file" })
        end,
        mode = { "n", "v" },
        desc = "Annotate file",
      },
      {
        "<leader>cNc",
        function()
          require("neogen").generate({ type = "class" })
        end,
        mode = { "n", "v" },
        desc = "Annotate class",
      },
      {
        "<leader>cNt",
        function()
          require("neogen").generate({ type = "type" })
        end,
        mode = { "n", "v" },
        desc = "Annotate type",
      },
    },
  },
}
