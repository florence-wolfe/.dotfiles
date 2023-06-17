return {
  {
    "Bekaboo/dropbar.nvim",
    config = function(_, opts)
      require("dropbar").setup(opts)
    end,
    event = "VeryLazy",
    keys = {
      {
        "<C-CR>",
        function()
          require("dropbar.api").pick()
        end,
        desc = "Dropbar pick",
      },
    },
  },
}
