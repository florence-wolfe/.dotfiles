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
    "luukvbaal/statuscol.nvim",
    opts = function()
      local builtin = require("statuscol.builtin")
      local cfg = {
        setopt = true, -- Whether to set the 'statuscolumn' option, may be set to false for those who
        -- want to use the click handlers in their own 'statuscolumn': _G.Sc[SFL]a().
        -- Although I recommend just using the segments field below to build your
        -- statuscolumn to benefit from the performance optimizations in this plugin.
        -- builtin.lnumfunc number string options
        thousands = false, -- or line number thousands separator string ("." / ",")
        relculright = false, -- whether to right-align the cursor line number with 'relativenumber' set
        -- Builtin 'statuscolumn' options
        ft_ignore = nil, -- lua table with filetypes for which 'statuscolumn' will be unset
        bt_ignore = nil, -- lua table with 'buftype' values for which 'statuscolumn' will be unset
        -- Default segments (fold -> sign -> line number + separator), explained below
        segments = {
          { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
          -- Git Signs
          { text = { "%s" }, click = "v:lua.ScSa" },
          -- Line numbers
          {
            text = { builtin.lnumfunc, " " },
            condition = { true, builtin.not_empty },
            click = "v:lua.ScLa",
          },
        },
        clickhandlers = { -- builtin click handlers
          Lnum = builtin.lnum_click,
          FoldClose = builtin.foldclose_click,
          FoldOpen = builtin.foldopen_click,
          FoldOther = builtin.foldother_click,
          DapBreakpointRejected = builtin.toggle_breakpoint,
          DapBreakpoint = builtin.toggle_breakpoint,
          DapBreakpointCondition = builtin.toggle_breakpoint,
          DiagnosticSignError = builtin.diagnostic_click,
          DiagnosticSignHint = builtin.diagnostic_click,
          DiagnosticSignInfo = builtin.diagnostic_click,
          DiagnosticSignWarn = builtin.diagnostic_click,
          GitSignsTopdelete = builtin.gitsigns_click,
          GitSignsUntracked = builtin.gitsigns_click,
          GitSignsAdd = builtin.gitsigns_click,
          GitSignsChange = builtin.gitsigns_click,
          GitSignsChangedelete = builtin.gitsigns_click,
          GitSignsDelete = builtin.gitsigns_click,
        },
      }
      return cfg
    end,
    config = function(_, opts)
      require("statuscol").setup(opts)
    end,
  },
  {
    "VonHeikemen/searchbox.nvim",
    dependencies = {
      { "MunifTanjim/nui.nvim" },
    },
    keys = {
      {
        "gR",
        -- [[:let @/='<C-r>=expand('<cword>')<CR>'<CR>:SearchBoxReplace<CR><C-r>/<CR>]],
        function()
          local nvim = vim.api
          -- Get the word under the cursor
          local word_under_cursor = nvim.nvim_call_function("expand", { "<cword>" })
          -- Set the search register `/` to the word under the cursor
          nvim.nvim_set_var("/", word_under_cursor)

          -- Execute the custom command SearchBoxReplace
          nvim.nvim_command("SearchBoxReplace confirm=menu")

          -- Insert the content of the search register `/` into the command line
          local keys = nvim.nvim_replace_termcodes("<C-r>/<CR>", true, false, true)
          nvim.nvim_feedkeys(keys, "n", false)
          -- Unset the / register since we used it in the replace already
          nvim.nvim_del_var("/")
        end,
        desc = "Search & Replace current word",
      },
      {
        "<leader>r",
        function()
          require("searchbox").replace({
            confirm = "menu",
            visual_mode = false,
            show_matches = true,
            case_sensitive = false,
            -- stylua-ignore
            modified = ":C\v",
          })
        end,
        mode = "n",
        desc = "Search & Replace buffer",
      },
      {
        "<leader>r",
        function()
          require("searchbox").replace({
            confirm = "menu",
            visual_mode = true,
            show_matches = true,
            case_sensitive = false,
            -- stylua-ignore
            modified = ":C\v",
          })
        end,
        mode = "x",
        desc = "Search & Replace selection",
      },
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
      Utils.create_keymap_group("<leader>cN", "+neogen")
    end,
    config = function(_, opts)
      require("neogen").setup(opts)
    end,
    keys = {
      {
        "<leader>cNf",
        function()
          require("neogen").generate({ type = "func" })
        end,
        mode = { "n", "v" },
        desc = "Annotate function",
      },
      {
        "<leader>cNF",
        function()
          require("neogen").generate({ type = "file" })
        end,
        mode = { "n", "v" },
        desc = "Annotate file",
      },
      {
        "<leader>cNc",
        function()
          require("neogen").generate({ type = "class" })
        end,
        mode = { "n", "v" },
        desc = "Annotate class",
      },
      {
        "<leader>cNt",
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
    config = function(_, opts)
      require("sentiment").setup(opts)
    end,
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
  {
    "mawkler/modicator.nvim",
    opts = {
      defaults = {
        bold = true,
        italic = true,
      },
      highlights = {
        modes = Colors.modicator_mode(),
      },
    },
    config = function(_, opts)
      require("modicator").setup(opts)
    end,
  },
}
