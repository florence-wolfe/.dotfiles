local colorscheme = require("utils.colorscheme")

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = colorscheme.get("lazyvim"),
    },
  },
}
