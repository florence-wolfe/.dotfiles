local colorscheme = require("utils.colorscheme")

return {
  {
    "utilyre/barbecue.nvim",
    enabled = false,
    name = "barbecue",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      show_dirname = false,
      show_basename = false,
      create_autocmd = false,
      theme = colorscheme.get("barbecue"),
    },
  },
}
