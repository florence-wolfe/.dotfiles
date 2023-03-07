return {
  {
    "echasnovski/mini.move",
    version = false,
    -- https://www.lazyvim.org/plugins/coding#minisurround
    keys = function(_, keys)
      -- Populate the keys based on the user's options
      local plugin = require("lazy.core.config").spec.plugins["mini.move"]
      local opts = require("lazy.core.plugin").values(plugin, "opts", false)
      local mappings = {
        { opts.mappings.up,         desc = "Move selection up",    mode = { "v" } },
        { opts.mappings.down,       desc = "Move selection down",  mode = { "v" } },
        { opts.mappings.left,       desc = "Move selection left",  mode = { "v" } },
        { opts.mappings.right,      desc = "Move selection right", mode = { "v" } },
        { opts.mappings.line_up,    desc = "Move line up" },
        { opts.mappings.line_down,  desc = "Move line down" },
        { opts.mappings.line_left,  desc = "Move line left" },
        { opts.mappings.line_right, desc = "Move line right" },
      }
      mappings = vim.tbl_filter(function(m)
        return m[1] and #m[1] > 0
      end, mappings)
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      mappings = {
        up = "<M-up>",
        down = "<M-down>",
        left = "<M-left>",
        right = "<M-right>",
        line_up = "<M-up>",
        line_down = "<M-down>",
        line_left = "<M-left>",
        line_right = "<M-right>",
      },
    },
    config = function(_, opts)
      require("mini.move").setup(opts)
    end,
  },
  {
    "echasnovski/mini.bracketed",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.bracketed").setup(opts)
    end,
  },
}
