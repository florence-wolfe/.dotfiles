local Utils = require("utils")
return {
  -- change some telescope options and add telescope-fzf-native
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-media-files.nvim" },
      { "ghassan0/telescope-glyph.nvim" },
      { "tsakirist/telescope-lazy.nvim" },
      { "benfowler/telescope-luasnip.nvim" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
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
        "<leader>R",
        "<cmd>Telescope resume<cr>",
        desc = "Resume Telescope results window",
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
        fzf = {
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        file_browser = {
          -- theme = 'ivy',
          -- disables netrw and use telescope-file-browser in its place
          theme = nil,
          hijack_netrw = false,
          -- mappings = {},
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
      telescope.load_extension("fzf")
      telescope.load_extension("undo")
      telescope.load_extension("adjacent")
      telescope.load_extension("lazy")
      telescope.load_extension("noice")
      telescope.load_extension("glyph")
      telescope.load_extension("media_files")
      telescope.load_extension("luasnip")
      -- telescope.load_extension("yank_history")
    end,
  },
}
