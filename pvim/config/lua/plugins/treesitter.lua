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
}
