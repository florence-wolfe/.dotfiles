return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    opts = {
      window = {
        position = "float",
      },
      filesystem = {
        bind_to_cwd = true,
        filtered_items = {
          visible = false, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
          hide_dotfiles = true,
          hide_gitignored = true,
        },
      },
    },
  },
}
