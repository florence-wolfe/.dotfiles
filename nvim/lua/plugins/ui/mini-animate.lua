return {
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    init = function(_, opts)
      local animate = require("mini.animate")
      -- Animate for 200 milliseconds with linear easing
      local timing = animate.gen_timing.linear({ duration = 100, unit = "total" })
      animate.setup({
        cursor = { timing = timing },
        scroll = { enable = false },
      })
    end,
  },
}
