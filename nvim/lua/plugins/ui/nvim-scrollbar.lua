local colors = require("tokyonight.colors").setup()

return {
  "petertriho/nvim-scrollbar",
  event = "VeryLazy",
  opts = {
    handle = {
      color = colors.bg_highlight,
    },
    marks = {
      Search = { color = colors.orange },
      Error = { color = colors.error },
      Warn = { color = colors.warning },
      Info = { color = colors.info },
      Hint = { color = colors.hint },
      Misc = { color = colors.purple },
      GitAdd = { text = "│" }, -- or another desired icon
      GitChange = { text = "│" },
      GitDelete = { text = "│" },
    },
  },
  config = function(_, opts)
    local scrollbar = require("scrollbar")
    scrollbar.setup(opts)
  end,
}
