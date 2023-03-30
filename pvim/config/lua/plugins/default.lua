local Utils = require("utils")
local ufoConf = require("utils.ufo-conf")
local Colors = require("utils.colors-conf")

return {
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      show_dirname = false,
      show_basename = false,
      create_autocmd = false,
      theme = Colors.barbecue,
    },
  },
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
    },
    keys = {
      { "<leader>t\\", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Term (float)" },
      { "<leader>t-", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle Term (horizontal)" },
      { "<leader>t|", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle Term (vertical)" },
    },
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
  { "tiagovla/scope.nvim", event = "VeryLazy", config = true },
  {
    "lewis6991/satellite.nvim",
    config = function(_, opts)
      require("satellite").setup(opts)
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require("ufo").setup({
        provider_selector = ufoConf.provider_selector,
        fold_virt_text_handler = ufoConf.handler,
      })
    end,
  },
  {
    "VonHeikemen/searchbox.nvim",
    dependencies = {
      { "MunifTanjim/nui.nvim" },
    },
  },
  {
    "folke/zen-mode.nvim",
    dependencies = {
      "folke/twilight.nvim",
    },
    keys = {
      {
        "<leader>Z",
        "<cmd>ZenMode<cr>",
        desc = "Toggle ZenMode",
      },
    },
    config = function()
      require("zen-mode").setup()
    end,
  },
  {
    "nmac427/guess-indent.nvim",
    config = function(_, opts)
      require("guess-indent").setup(opts)
    end,
  },
  {
    "nacro90/numb.nvim",
    config = function(_, opts)
      require("numb").setup(opts)
    end,
  },
  {
    "winston0410/range-highlight.nvim",
    dependencies = {
      { "winston0410/cmd-parser.nvim" },
    },
    config = function(_, opts)
      require("range-highlight").setup(opts)
    end,
  },
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinNew" },
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {
      snippet_engine = "luasnip",
    },
    init = function()
      Utils.create_keymap_group("<leader>a", "+annotations")
    end,
    config = function(_, opts)
      require("neogen").setup(opts)
    end,
    keys = {
      {
        "<leader>af",
        function()
          require("neogen").generate({ type = "func" })
        end,
        mode = { "n", "v" },
        desc = "Annotate function",
      },
      {
        "<leader>aF",
        function()
          require("neogen").generate({ type = "file" })
        end,
        mode = { "n", "v" },
        desc = "Annotate file",
      },
      {
        "<leader>ac",
        function()
          require("neogen").generate({ type = "class" })
        end,
        mode = { "n", "v" },
        desc = "Annotate class",
      },
      {
        "<leader>at",
        function()
          require("neogen").generate({ type = "type" })
        end,
        mode = { "n", "v" },
        desc = "Annotate type",
      },
    },
  },

  {
    -- https://github.com/SmiteshP/nvim-navbuddy
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      {
        "<leader>cn",
        function()
          require("nvim-navbuddy").open()
        end,
        desc = "Navbuddy",
      },
    },
    opts = {
      lsp = {
        auto_attach = true,
      },
      window = {
        position = "100%",
      },
    },
    init = function(_, opts)
      require("nvim-navbuddy").setup(opts)
    end,
  },
  {
    "utilyre/sentiment.nvim",
  },
  { "chrisgrieser/nvim-spider", lazy = true },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "nathom/filetype.nvim",
    opts = {
      overrides = {
        extensions = {
          -- Set the filetype of *.pn files to potion
          rc = "sh",
        },
      },
    },
    config = function(_, opts)
      require("filetype").setup(opts)
    end,
  },
  { "lewis6991/impatient.nvim" },
}
