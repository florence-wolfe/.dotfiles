return {
  "ggandor/leap.nvim",
  init = function()
    vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" }) -- or some grey
    vim.api.nvim_set_hl(0, "LeapMatch", {
      -- For light themes, set to 'black' or similar.
      fg = "white",
      bold = true,
      nocombine = true,
    })
    -- Of course, specify some nicer shades instead of the default "red" and "blue".
    vim.api.nvim_set_hl(0, "LeapLabelPrimary", {
      fg = "red",
      bold = true,
      nocombine = true,
    })
    vim.api.nvim_set_hl(0, "LeapLabelSecondary", {
      fg = "blue",
      bold = true,
      nocombine = true,
    })
  end,
}
