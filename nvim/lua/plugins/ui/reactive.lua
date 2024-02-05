return {
  {
    "rasulomaroff/reactive.nvim",
    opts = {
      load = { "catppuccin-mocha-cursor", "catppuccin-mocha-cursorline" },
      builtin = {
        cursorline = true,
        cursor = true,
        modemsg = true,
      },
    },
    config = function(_, opts)
      require("reactive").setup(opts)
    end,
  },
}
