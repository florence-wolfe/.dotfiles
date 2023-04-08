local wilderConf = require("utils.wilder-conf")

return {
  {
    "gelguy/wilder.nvim",
    enabled = false,
    dependencies = {
      { "romgrk/fzy-lua-native" },
      { "sharkdp/fd" },
      { "nvim-tree/nvim-web-devicons" },
      { "nixprime/cpsm" },
    },
    opts = { modes = { ":", "/", "?" } },
    config = function(_, opts)
      local wilder = require("wilder")
      wilder.setup(opts)
      wilder.set_option("use_python_remote_plugin", 0)
      wilder.set_option("pipeline", {
        wilder.branch(
          wilder.cmdline_pipeline({
            fuzzy = 1,
            fuzzy_filter = wilder.lua_fzy_filter(),
          }),
          {
            wilder.check(function(ctx, x)
              return x == ""
            end),
            wilder.history(),
          },
          wilder.vim_search_pipeline()
        ),
      })

      wilder.set_option(
        "renderer",
        wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
          highlighter = wilder.lua_fzy_highlighter(),
          left = { " ", wilder.popupmenu_devicons() },
          right = { " ", wilder.popupmenu_scrollbar() },
          min_width = "100%", -- minimum height of the popupmenu, can also be a number
          min_height = "50%", -- to set a fixed height, set max_height to the same value
          reverse = 0, -- if 1, shows the candidates from bottom to top
          highlights = {
            border = "Normal", -- highlight to use for the border
            accent = wilder.make_hl("WilderAccent", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }),
          },
          -- 'single', 'double', 'rounded' or 'solid'
          -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
          border = "rounded",
        }))
      )
    end,
  },
}
