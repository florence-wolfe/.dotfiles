local Utils = require("utils")
return {
  -- change some telescope options and add telescope-fzf-native
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "ghassan0/telescope-glyph.nvim" },
      { "tsakirist/telescope-lazy.nvim" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      { "nvim-telescope/telescope-file-browser.nvim" },
      {
        "prochri/telescope-all-recent.nvim",
        dependencies = { "kkharji/sqlite.lua" },
        opts = {
          default = {
            sorting = "frecency", -- sorting: options: 'recent' and 'frecency'
          },
        },
        config = function(_, opts)
          require("telescope-all-recent").setup(opts)
        end,
      },
      { "debugloop/telescope-undo.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
      { "MaximilianLloyd/adjacent.nvim" },
    },
    keys = {
      -- add a keymap to browse plugin files
      { "<leader><space>", require("lazyvim.util").telescope("files"), desc = "Find Files (root dir)" },
      {
        "<leader>fa",
        "<cmd>Telescope adjacent<CR>",
        desc = "Find adjacent files",
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
      { "<C-p>", require("lazyvim.util").telescope("find_files", { cwd = false }), desc = "Find Files (cwd)" },
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
      {
        "<leader>sl",
        function()
          require("telescope").extensions.lazy.lazy()
        end,
        desc = "Lazy",
      },
      {
        "<leader>sN",
        "<cmd>Telescope noice<cr>",
        desc = "Noice",
      },
      {
        "<leader>si",
        "<cmd>Telescope glyph<cr>",
        desc = "Glyph",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            ["<C-h>"] = "which_key",
          },
        },
      },
      extensions = {
        undo = {},
        adjacent = {
          level = 1, -- default
        },
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
        find_files = {
          find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
        },
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
      telescope.load_extension("undo")
      telescope.load_extension("adjacent")
      telescope.load_extension("lazy")
      telescope.load_extension("noice")
      telescope.load_extension("glyph")
      -- telescope.load_extension("yank_history")
    end,
  },
}
