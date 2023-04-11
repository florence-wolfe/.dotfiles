local colorscheme = require("utils.colorscheme")

return {
  {
    "mawkler/modicator.nvim",
    opts = {
      defaults = {
        bold = true,
        italic = true,
      },
      highlights = {
        modes = colorscheme.modicator_mode(),
      },
    },
    config = function(_, opts)
      require("modicator").setup(opts)
    end,
  },
}
