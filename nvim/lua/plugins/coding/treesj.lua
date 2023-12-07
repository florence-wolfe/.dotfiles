return {
  {
    "Wansmer/treesj",
    keys = {
      {
        "gS",
        function()
          require("treesj").toggle()
        end,
        desc = "Toggle split/join",
      },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function(_, opts)
      require("treesj").setup(opts)
    end,
    opts = {
      use_default_keymaps = false,
    },
  },
}
