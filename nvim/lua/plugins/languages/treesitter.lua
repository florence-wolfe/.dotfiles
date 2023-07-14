local utils = require("utils")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
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
        disable = { "html" },
      },
      indent = { enable = false },
      context_commentstring = { enable = true },
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
    "windwp/nvim-ts-autotag",
  },
}
