return {
  {
    "samodostal/image.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "m00qek/baleia.nvim",
    },
    opts = {
      -- Require and call setup function somewhere in your init.lua
      render = {
        min_padding = 5,
        show_label = true,
        use_dither = true,
        foreground_color = true,
        background_color = true,
      },
      events = {
        update_on_nvim_resize = true,
      },
    },
    config = function(_, opts)
      require("image").setup(opts)
    end,
  },
}
