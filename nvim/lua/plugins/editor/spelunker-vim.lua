-- local colorscheme = require("utils.colorscheme")
-- local colors = colorscheme.get("colors")
-- vim.cmd(string.format("highlight SpelunkerSpellBad guifg=white guisp=%s gui=undercurl cterm=undercurl", colors.yellow))
-- vim.cmd(string.format("highlight SpelunkerComplexOrCompoundWord guisp=%s gui=undercurl", colors.yellow))
-- bananaa
return {
  {
    "kamykn/spelunker.vim",
    dependencies = {
      { "kamykn/popup-menu.nvim" },
    },
    enabled = false,
    init = function()
      vim.g.spelunker_check_type = 1
    end,
  },
}
