local Utils = require("utils")
return {
  -- change some telescope options and add telescope-fzf-native
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
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
      { "<A-p>", require("lazyvim.util").telescope("find_files", { cwd = false }), desc = "Find Files (cwd)" },
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
      {
        "<C-p>",
        function()
          local _, err = pcall(require("telescope").extensions.npm.packages)
          if err then
            print("No package.json")
          end
        end,
        desc = "Find NPM Packages",
      },
      {
        "<leader>sT",
        function()
          require("telescope.builtin").colorscheme({ enable_preview = true })
        end,
        desc = "Themes",
      },
      {
        "<leader>sy",
        function()
          require("telescope").extensions.yank_history.yank_history()
        end,
        desc = "Yank History",
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
      telescope.load_extension("frecency")
      telescope.load_extension("npm")
      telescope.load_extension("undo")
      -- telescope.load_extension("yank_history")
    end,
  },
}
