local Utils = require("utils")
return {
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
        "json5",
        "jsonc",
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
      Utils.create_keymap_group("<leader>d", "+definition")
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
          select = {
            enable = true,
            keymaps = {
              -- You can use the following keymaps as they do not conflict with any known key mappings
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["aC"] = "@comment.outer",
              ["iC"] = "@comment.inner",
              ["ab"] = "@block.outer",
              ["ib"] = "@block.inner",
              ["ap"] = "@parameter.outer",
              ["ip"] = "@parameter.inner",
              ["as"] = "@statement.outer",
              ["is"] = "@statement.inner",
            },
          },
          swap = {
            enable = true,
            swap_previous = {
              ["<leader>A"] = "@parameter.inner",
            },
            swap_next = {
              ["<leader>a"] = "@parameter.inner",
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
}
