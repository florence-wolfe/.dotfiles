return {
  {
    "andymass/vim-matchup",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "status" }
      vim.g.matchup_surround_enabled = 1
      vim.g.matchup_transmute_enabled = 1
    end,
  },
}
