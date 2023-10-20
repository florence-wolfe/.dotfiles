return {
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "BufReadPre",
    opts = {
      text = {
        spinner = "moon",
        done = "󰗡",
      },
      sources = { -- Sources to configure
        ["null-ls"] = { -- Name of source
          ignore = true, -- Ignore notifications from this source
        },
      },
      window = {
        blend = 0,
        border = "rounded",
      },
      -- Just adding a space around the format to make it prettier
      fmt = {
        -- function to format fidget title
        fidget = function(fidget_name, spinner)
          return string.format(" %s %s ", spinner, fidget_name)
        end,
        -- function to format each task line
        task = function(task_name, message, percentage)
          return string.format(
            " %s%s [%s] ",
            message,
            percentage and string.format(" (%s%%)", percentage) or "",
            task_name
          )
        end,
      },
    },
    config = function(_, opts)
      require("fidget").setup(opts)
    end,
  },
}
