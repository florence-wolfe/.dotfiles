local colorscheme = require("utils.colorscheme")

return {
  {
    "nvim-zh/colorful-winsep.nvim",
    opts = {
      highlight = colorscheme.get("winsep"),
    },
    config = function(_, opts)
      require("colorful-winsep").setup(opts)
    end,
    event = { "WinNew" },
  },
}
