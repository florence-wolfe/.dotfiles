local colorscheme = require("utils.colorscheme")

return {
  {
    "akinsho/bufferline.nvim",
    init = function()
      local bufline = require("catppuccin.groups.integrations.bufferline")
      function bufline.get()
        return bufline.get_theme()
      end
    end,
    ---@type BufferlineConfig
    opts = {
      highlights = colorscheme.get("bufferline"),
      --- The options table for configuring bufferline
      options = {
        themable = true,
        separator_style = "thick",
        show_tab_indicators = true,
        indicator = {
          style = "underline",
        },
      },
    },
  },
}
