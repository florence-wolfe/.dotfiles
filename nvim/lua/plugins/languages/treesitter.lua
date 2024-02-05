local utils = require("utils")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    opts = {
      ensure_installed = {
        "astro",
        "bash",
        "html",
        "css",
        "scss",
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
        "vimdoc",
        "yaml",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = { "html" },
      },
      indent = { enable = false },
      autotag = { enable = true },
      textobjects = {
        lsp_interop = {
          enable = true,
          border = "rounded",
          floating_preview_opts = {},
          peek_definition_code = {
            ["<leader>df"] = { query = "@function.outer", desc = "Peek definition of a function" },
            ["<leader>dF"] = { query = "@class.outer", desc = "Peek definition of a class" },
          },
        },
      },
    },
    init = function()
      utils.create_keymap_group("<leader>d", "+definition")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "code-biscuits/nvim-biscuits",
    opts = {
      cursor_line_only = true,
    },
    config = function(_, opts)
      require("nvim-biscuits").setup(opts)
    end,
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    lazy = false,
    opts = { useDefaultKeymaps = true },
  },
}
