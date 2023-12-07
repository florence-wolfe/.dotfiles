return {
  {
    "echasnovski/mini.clue",
    event = { "VimEnter" },
    enabled = false,
    opts = function()
      local mini_clue = require("mini.clue")
      return {
        window = {
          config = {
            width = "auto",
          },
          delay = 500,
          scroll_down = "<C-d>",
          scroll_up = "<C-u>",
        },
        triggers = {
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },
          { mode = "n", keys = ";" },
          { mode = "n", keys = ";p" },
          { mode = "n", keys = "<C-c>" },
          { mode = "n", keys = "<C-c><C-c>" },
          { mode = "n", keys = "d" },
          { mode = "n", keys = "]" },
          { mode = "n", keys = "[" },
          { mode = "n", keys = "y" },
          { mode = "x", keys = "y" },
          { mode = "n", keys = "c" },
          { mode = "x", keys = "c" },
        },
        clues = {
          mini_clue.gen_clues.builtin_completion(),
          mini_clue.gen_clues.g(),
          mini_clue.gen_clues.marks(),
          mini_clue.gen_clues.registers(),
          mini_clue.gen_clues.windows(),
          mini_clue.gen_clues.z(),
        },
      }
    end,
    config = function(_, opts)
      require("mini.clue").setup(opts)
    end,
  },
}
