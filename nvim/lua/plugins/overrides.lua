local Colors = require("utils.colors-conf")
local Utils = require("utils")

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = Colors.lazyvim,
    },
  },
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
          theme = Colors.lualine,
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
  {
    "SmiteshP/nvim-navic",
    opts = {
      highlight = true,
    },
  },
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  { "echasnovski/mini.pairs", enabled = false },
  { "echasnovski/mini.ai", enabled = false },
  { "echasnovski/mini.comment", enabled = false },
  {
    "akinsho/bufferline.nvim",
    init = function()
      Utils.create_keymap_group("<leader>bm", "+Manage Buffers")
    end,
    keys = {
      {
        "<leader>bmh",
        "<cmd>BufferLineCloseLeft<cr>",
        desc = "close all buffers to the left",
      },
      {
        "<leader>bmr",
        "<cmd>BufferLineCloseRight<cr>",
        desc = "close all buffers to the (r)ight",
      },
      {
        "<leader>bms",
        "<cmd>BufferLinePick<cr>",
        desc = "(s)elect a buffer",
      },
      {
        "<leaderbmc>",
        "<cmd>BufferLinePickClose<cr>",
        desc = "pick a buffer and (c)lose it",
      },
      {
        "<leader>bmn",
        "<cmd>BufferLineMoveNext<cr>",
        desc = "move buffer to (n)ext position",
      },
      {
        "<leader>bmp",
        "<cmd>BufferLineMovePrev<cr>",
        desc = "move buffer to (p)revious position",
      },
      {
        "<leader>bmf",
        function()
          require("bufferline").move_to(1)
        end,
        desc = "move buffer to (f)irst position",
      },
      {
        "<leader>bml",
        function()
          require("bufferline").move_to(-1)
        end,
        desc = "move buffer to (l)ast position",
      },
    },
    ---@type BufferlineConfig
    opts = {
      highlights = Colors.bufferline(),
      --- The options table for configuring bufferline
      ---@type BufferlineOptions
      options = {
        separator_style = "thick",
        always_show_bufferline = true,
        show_tab_indicators = true,
        indicator = {
          style = "underline",
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    opts = {
      window = {
        position = "float",
      },
      filesystem = {
        bind_to_cwd = true,
        filtered_items = {
          visible = false, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
          hide_dotfiles = true,
          hide_gitignored = true,
        },
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context = true,
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true, -- add a border to hover docs and signature help
        inc_rename = true, -- add a border to the inc rename window
      },
      routes = {
        {
          filter = {
            find = "Detached buffer",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            kind = "wmsg",
          },
          opts = { skip = true },
        },
      },
    },
  },
}
