return {
  {
    "yuki-yano/highlight-undo.nvim",
    enabled = false,
    dependencies = {
      { "vim-denops/denops.vim" },
    },
    config = function(_, opts)
      require("highlight-undo").setup(opts)
    end,
  },
}
