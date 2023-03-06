local Utils = require("utils")

return {
  {
    "sitiom/nvim-numbertoggle",
    event = {
      "BufEnter",
      "FocusGained",
      "WinEnter",
      "InsertEnter",
      "CmdlineEnter",
    },
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },
  {
    "windwp/nvim-autopairs",
    opts = {
      check_ts = true,
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    init = function()
      Utils.create_keymap_group("<leader>t", "+terminal")
    end,
    opts = {
      size = 20,
      open_mapping = [[<c-\>]],
      start_in_insert = true,
      persist_size = true,
      persist_mode = true,
      close_on_exit = true,
      auto_scroll = true,
      shade_terminals = false,
      -- highlights = {
      --   Normal = {
      --     guibg = require("catppuccin.palettes").get_palette().base,
      --   },
      -- },
    },
    keys = {
      { "<leader>t\\", "<cmd>ToggleTerm direction=float<cr>",      desc = "Toggle Term (float)" },
      { "<leader>t-",  "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle Term (horizontal)" },
      { "<leader>t|",  "<cmd>ToggleTerm direction=vertical<cr>",   desc = "Toggle Term (vertical)" },
    },
  },
  {
    "echasnovski/mini.move",
    version = false,
    event = "VeryLazy",
    -- Taken from https://github.com/LazyVim/LazyVim/blob/8e84dcf85c8a73ebcf6ade6b7b77544f468f1dfa/lua/lazyvim/plugins/coding.lua#L97-L113
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
    "sindrets/diffview.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      {
        "<leader>gd",
        "<cmd>DiffviewOpen<cr>",
        desc = "DiffviewOpen",
      },
      {
        "<leader>gD",
        "<cmd>DiffviewClose<cr>",
        desc = "DiffviewClose",
      },
      {
        "<leader>gH",
        "<cmd>DiffviewFileHistory<cr>",
        desc = "DiffviewFileHistory",
      },
    },
  },
  {
    "mbbill/undotree",
    keys = {
      {
        "<leader>fU",
        "<cmd>UndotreeToggle<cr>",
        desc = "Undotree Toggle",
      },
    },
  },
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "HiPhish/nvim-ts-rainbow2" },
    opts = {
      ensure_installed = {
        "bash",
        "help",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "nix",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
    init = function()
      require("nvim-treesitter.configs").setup({
        rainbow = { enable = true },
        textobjects = {
          lsp_interop = {
            enable = true,
            border = "rounded",
            floating_preview_opts = {},
            peek_definition_code = {
              ["<leader>df"] = "@function.outer",
              ["<leader>dF"] = "@class.outer",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner",
            },
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    init = function(_, opts)
      require("treesitter-context").setup(opts)
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  -- add any tools you want to have installed below
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "echasnovski/mini.bracketed",
    init = function(_, opts)
      require("mini.bracketed").setup(opts)
    end,
  },
  {
    "sunjon/Shade.nvim",
    opts = {
      overlay_opacity = 65,
    },
    config = function(_, opts)
      require("shade").setup(opts)
    end,
  },
  { "metakirby5/codi.vim", event = "VeryLazy" },
  { "tiagovla/scope.nvim", event = "VeryLazy", config = true },
  {
    "onsails/lspkind.nvim",
    event = "VeryLazy",
  },
}
