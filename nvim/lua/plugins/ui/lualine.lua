local colorscheme = require("utils.colorscheme")

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      ---@type LazyVimConfig
      local config = require("lazyvim.config")
      local icons = config.icons
      local hide_in_width = function()
        return vim.fn.winwidth(0) > 100
      end
      return {
        --- @type LazyVimConfig
        options = {
          theme = colorscheme.get("lualine"),
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", path = 1 },
          },
          lualine_x = {
            {
              "searchcount",
              icon = "",
              timeout = 500,
              maxcount = 999,
            },
            {
              "diff",
              colored = true, -- Displays a colored diff status if set to true
              diff_color = {
                -- Same color values as the general color option can be used here.
                added = "DiffAdd", -- Changes the diff's added color
                modified = "DiffChange", -- Changes the diff's modified color
                removed = "DiffDelete", -- Changes the diff's removed color you
              },
              symbols = { added = icons.git.added, modified = icons.git.modified, removed = icons.git.removed }, -- Changes the symbols used by the diff.
              source = nil, -- A
              -- It must return a table as such:
              --   { added = add_count, modified = modified_count, removed = removed_count }
              -- or nil on failure. count <= 0 won't be displayed.
              cond = hide_in_width,
            },
          },
          lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            {
              "fileformat",
              cond = hide_in_width,
              symbols = {
                unix = "", -- e712
                dos = "", -- e70f
                mac = "", -- e711
              },
            },
            { icon = "", "hostname", cond = hide_in_width },
          },
        },
        extensions = {
          "neo-tree",
          "lazy",
          "man",
          "quickfix",
          "symbols-outline",
          "toggleterm",
          -- "trouble",
        },
      }
    end,
  },
}
