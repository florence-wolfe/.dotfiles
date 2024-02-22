local Utils = require("utils")

return {
  -- change some telescope options and add telescope-fzf-native
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "piersolenski/telescope-import.nvim" },
      { "nvim-telescope/telescope-media-files.nvim" },
      { "florence-robert/telescope-glyph.nvim" },
      { "tsakirist/telescope-lazy.nvim" },
      { "benfowler/telescope-luasnip.nvim" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        -- for windows
        -- zig cc -O3 -Wall -Werror -fpic -std=gnu99 -shared src/fzf.c -o build\libfzf.dll
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
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
          if vim.loop.os_uname().sysname == "Windows_NT" then
            vim.g.sqlite_clib_path = "C:\\ProgramData\\chocolatey\\lib\\SQLite\\tools\\sqlite3.dll"
          end
          require("telescope-all-recent").setup(opts)
        end,
      },
      { "debugloop/telescope-undo.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
      { "MaximilianLloyd/adjacent.nvim" },
    },
    keys = {
      -- add a keymap to browse plugin files
      { "<leader><space>", require("lazyvim.util").telescope("files"), desc = "Find Files (root dir)" },
      { "<c-p>", require("lazyvim.util").telescope("files", { cwd = vim.loop.cwd() }), desc = "Find Files (cwd)" },
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
      {
        "<leader>fB",
        function()
          require("telescope").extensions.file_browser.file_browser({
            preview = true,
          })
        end,
        desc = "File Browser",
      },
      {
        "<leader>sq",
        function()
          require("telescope.builtin").quickfix()
        end,
        desc = "Quickfix",
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
        "<leader>sg",
        "<cmd>Telescope glyph<cr>",
        desc = "Glyph",
      },
      {
        "<leader>sL",
        "<cmd>Telescope luasnip<cr>",
        desc = "Luasnip",
      },
      {
        "<leader>xs",
        function()
          require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor({}))
        end,
        desc = "Spelling Suggestions",
      },
      {
        "<leader>si",
        "<cmd>Telescope import<cr>",
        desc = "Import",
      },
    },
    -- change some options
    opts = {
      defaults = {
        preview = {
          mime_hook = function(filepath, bufnr, opts)
            local is_image = function(filepath)
              local image_extensions = { "png", "jpg", "jpeg", "gif" } -- Supported image formats
              local split_path = vim.split(filepath:lower(), ".", { plain = true })
              local extension = split_path[#split_path]
              return vim.tbl_contains(image_extensions, extension)
            end
            if is_image(filepath) then
              local term = vim.api.nvim_open_term(bufnr, {})
              local function send_output(_, data, _)
                for _, d in ipairs(data) do
                  vim.api.nvim_chan_send(term, d .. "\r\n")
                end
              end
              vim.fn.jobstart({
                "viu",
                "-w",
                "40",
                "-b",
                filepath, -- Terminal image viewer command
              }, { on_stdout = send_output, stdout_buffered = true })
            else
              require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
            end
          end,
        },
        layout_strategy = "flex",
        layout_config = {
          prompt_position = "top",
          horizontal = {
            mirror = true,
            preview_cutoff = 100,
            preview_width = 0.5,
          },
          vertical = {
            mirror = true,
            preview_cutoff = 0.4,
          },
          flex = {
            flip_columns = 110,
          },
          height = 0.94,
          width = 0.86,
        },
        sorting_strategy = "ascending",
        winblend = 0,
        dynamic_preview_title = true,
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
        file_browser = {
          -- theme = 'ivy',
          -- disables netrw and use telescope-file-browser in its place
          theme = nil,
          hijack_netrw = false,
          -- mappings = {},
        },
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = { -- extend mappings
            i = {
              ["<C-k>"] = function()
                require("telescope-live-grep-args.actions").quote_prompt()
              end,
              ["<C-i>"] = function()
                require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " })
              end,
            },
          },
          -- ... also accepts theme settings, for example:
          -- theme = "dropdown", -- use dropdown theme
          -- theme = { }, -- use own theme spec
          -- layout_config = { mirror=true }, -- mirror preview pane
        },
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
        find_files = {
          path_display = { "smart" },
          find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
        },
        live_grep = {
          path_display = { "shorten" },
          mappings = {
            i = {
              ["<C-f>"] = Utils.ts_select_dir_for_grep,
            },
            n = {
              ["<C-f>"] = Utils.ts_select_dir_for_grep,
            },
          },
        },
        lsp_references = {
          path_display = { "shorten" },
        },
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("WinLeave", {
        callback = function()
          if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
          end
        end,
      })
    end,
    -- apply the config and additionally load fzf-native
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("undo")
      telescope.load_extension("adjacent")
      telescope.load_extension("lazy")
      telescope.load_extension("noice")
      telescope.load_extension("glyph")
      telescope.load_extension("media_files")
      telescope.load_extension("luasnip")
      telescope.load_extension("yank_history")
      telescope.load_extension("import")
      telescope.load_extension("live_grep_args")
    end,
  },
}
