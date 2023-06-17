return {
  {
    "HampusHauffman/block.nvim",
    keys = {
      {
        "<leader>cb",
        "<cmd>Block<cr>",
        desc = "Toggle Block",
      },
    },
    config = function(_, opts)
      require("block").setup(opts)
    end,
  },
}
