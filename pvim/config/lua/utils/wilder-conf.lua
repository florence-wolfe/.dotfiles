local M = {}

M.set_pipeline = function()
  local wilder = require("wilder")

  wilder.set_option("pipeline", {
    wilder.branch(
      wilder.cmdline_pipeline({
        fuzzy = 1,
        set_pcre2_pattern = 1,
      }),
      wilder.python_search_pipeline({
        pattern = "fuzzy",
      })
    ),
  })
end

return M
