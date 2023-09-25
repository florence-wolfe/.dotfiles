return {
  "echasnovski/mini.animate",
  cond = function()
    if vim.g.neovide then
      return false
    end
  end,
}
