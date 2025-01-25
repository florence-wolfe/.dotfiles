return {
  "folke/noice.nvim",
  opts = {
    routes = {
      { filter = { event = "msg_show", kind = "print" }, opts = { skip = true } },
      { -- route long messages to split
        filter = {
          event = "msg_show",
          any = { { min_height = 5 }, { min_width = 200 } },
          ["not"] = {
            kind = { "confirm", "confirm_sub", "return_prompt", "quickfix", "search_count" },
          },
          blocking = false,
        },
        view = "messages",
        opts = { stop = true },
      },
      { -- route long messages to split
        filter = {
          event = "msg_show",
          any = { { min_height = 5 }, { min_width = 200 } },
          ["not"] = {
            kind = { "confirm", "confirm_sub", "return_prompt", "quickfix", "search_count" },
          },
          blocking = true,
        },
        view = "mini",
      },
      -- Hide annoying messages
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "Detached buffer" },
            { kind = "wmsg" },
            { find = "^nvim%-navic:.*Already attached to %w+" },
            { find = "^error%(satellite.nvim%):" },
            { find = "code = %-32801" },
            { find = "attempt to index local 'request' %(a nil value%)" },
            { find = "^%[.*%] .*$" },
            { find = "E592: 'winwidth' cannot be smaller than 'winminwidth'" },
          },
        },
        opts = { skip = true },
      },
    },
  },
}
