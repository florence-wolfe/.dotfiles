local colorscheme = require("utils.colorscheme")

return {
  {
    "mawkler/modicator.nvim",
    enabled = false,
    opts = {
      defaults = {
        bold = true,
        italic = true,
      },
    },
    config = function(_, opts)
      require("modicator").setup(opts)
    end,
  },
}
