local Utils = require("utils")
-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { { "hrsh7th/cmp-emoji" }, { "hrsh7th/cmp-nvim-lua" } },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(
        vim.list_extend(opts.sources, { { name = "emoji" }, { name = "nvim_lua", include_deprecated = true } })
      )
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },
    },
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
      { "<leader>t\\", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Term (float)" },
      { "<leader>t-", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle Term (horizontal)" },
      { "<leader>t|", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle Term (vertical)" },
    },
  },
  {
    "echasnovski/mini.move",
    version = false,
    -- Taken from https://github.com/LazyVim/LazyVim/blob/8e84dcf85c8a73ebcf6ade6b7b77544f468f1dfa/lua/lazyvim/plugins/coding.lua#L97-L113
    keys = function(_, keys)
      -- Populate the keys based on the user's options
      local plugin = require("lazy.core.config").spec.plugins["mini.move"]
      local opts = require("lazy.core.plugin").values(plugin, "opts", false)
      local mappings = {
        { opts.mappings.up, desc = "Move selection up", mode = { "v" } },
        { opts.mappings.down, desc = "Move selection down", mode = { "v" } },
        { opts.mappings.left, desc = "Move selection left", mode = { "v" } },
        { opts.mappings.right, desc = "Move selection right", mode = { "v" } },
        { opts.mappings.line_up, desc = "Move line up" },
        { opts.mappings.line_down, desc = "Move line down" },
        { opts.mappings.line_left, desc = "Move line left" },
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
  -- change some telescope options and add telescope-fzf-native
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "nvim-telescope/telescope-frecency.nvim", dependencies = { "kkharji/sqlite.lua" } },
      { "elianiva/telescope-npm.nvim" },
      { "debugloop/telescope-undo.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader><space>",
        function()
          require('telescope').extensions.frecency.frecency({ workspace = 'CWD' })
        end,
        desc = "Find Files (root dir) #frecency",
      },
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fu",
        "<cmd>Telescope undo<cr>",
        desc = "Undo",
      },
      { "<A-p>", require("lazyvim.util").telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      {
        "<C-n>",
        function()
          local _, err = pcall(require("telescope").extensions.npm.scripts)
          if err then
            print("No package.json")
          end
        end,
        desc = "Find NPM Scripts",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
      extensions = {
        frecency = {
          db_root = "$HOME/.dotfiles/pvim/clutter",
          workspaces = {
            CWD = require("lazy.core.config").options.root,
          },
          show_scores = true,
        },
        undo = {},
      },
      pickers = {
        live_grep = {
          mappings = {
            i = {
              ["<C-f>"] = Utils.ts_select_dir_for_grep,
            },
            n = {
              ["<C-f>"] = Utils.ts_select_dir_for_grep,
            },
          },
        },
      },
    },
    -- apply the config and additionally load fzf-native
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")
      telescope.load_extension("frecency")
      telescope.load_extension("npm")
      telescope.load_extension("undo")
    end,
  },
  { "luochen1990/rainbow" },
  {
    "neovim/nvim-lspconfig",
    branch = "master",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
        tsserver = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "mrjones2014/nvim-ts-rainbow" },
    opts = {
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
      },
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
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    event = "VeryLazy",
    opts = {
      custom_highlights = function(colors)
        return {
          VertSplit = { fg = colors.sapphire },
        }
      end,
      term_colors = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        illuminate = true,
        leap = true,
        mason = true,
        mini = true,
        noice = true,
        notify = true,
        nvimtree = true,
        symbols_outline = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        ts_rainbow = true,
        which_key = true,
      },
    },
  },
  {
    "shaunsingh/nord.nvim",
    event = "VeryLazy",
  },
  {
    "morhetz/gruvbox",
    event = "VeryLazy",
  },
  {
    "RRethy/nvim-base16",
    event = "VeryLazy",
  },
  -- use mini.starter instead of alpha
  { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- add jsonls and schemastore ans setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  { "LnL7/vim-nix" },
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "nil",
        "json-lsp",
        "lua-language-server",
        "prettierd",
        "pyright",
        "rnix-lsp",
        "typescript-language-server",
      },
    },
  },
  {
    "karb94/neoscroll.nvim",
    config = true,
  },
  {
    "echasnovski/mini.bracketed",
    init = function(_, opts)
      require("mini.bracketed").setup({})
    end,
  },
}
