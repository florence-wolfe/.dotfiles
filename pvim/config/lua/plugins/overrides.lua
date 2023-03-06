return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
        show_tab_indicators = true,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
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
  -- use mini.starter instead of alpha
  { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- add jsonls and schemastore ans setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },
}
