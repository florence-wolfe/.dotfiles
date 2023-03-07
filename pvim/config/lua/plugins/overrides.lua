return {
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  { "echasnovski/mini.pairs", enabled = false },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        indicator = {
          style = "underline"
        },
        diagnostics_update_in_insert = true,
        always_show_bufferline = true,
        show_tab_indicators = true,
        hover = {
          enabled = true,
          delay = 50,
          reveal = { "close" },
        },
        separator_style = "slant"
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    show_current_context = true,
  }
}
