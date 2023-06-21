local utils = require("utils")
local ts_utils = require("nvim-treesitter.ts_utils")

local function select_next_sibling()
  local bufnr = vim.api.nvim_get_current_buf()
  local node = vim.treesitter.get_node({ bufnr = bufnr })
  if not node then
    return
  end
  local next_node = ts_utils.get_next_node(node)
  local next_sibling = node:next_sibling()
  if next_node then
    ts_utils.update_selection(bufnr, next_node)
  end
end

local function select_prev_sibling()
  local node = ts_utils.get_node_at_cursor()
  if not node then
    return
  end
  local prev_node = node:prev_sibling()

  if prev_node then
    ts_utils.update_selection(vim.api.nvim_get_current_buf(), prev_node)
  end
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    dependencies = { "HiPhish/nvim-ts-rainbow2" },
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
      context_commentstring = { enable = true, enable_autocmd = false },
      rainbow = { enable = true },
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
        select = {
          enable = true,
          keymaps = {
            -- You can use the following keymaps as they do not conflict with any known key mappings
            ["af"] = { query = "@function.outer", desc = "Select outer function" },
            ["if"] = { query = "@function.inner", desc = "Select inner function" },
            ["ac"] = { query = "@class.outer", desc = "Select outer class" },
            ["ic"] = { query = "@class.inner", desc = "Select inner class" },
            ["aC"] = { query = "@comment.outer", desc = "Select outer comment" },
            ["iC"] = { query = "@comment.inner", desc = "Select inner comment" },
            ["ab"] = { query = "@block.outer", desc = "Select outer block" },
            ["ib"] = { query = "@block.inner", desc = "Select inner block" },
            ["ap"] = { query = "@parameter.outer", desc = "Select outer parameter" },
            ["ip"] = { query = "@parameter.inner", desc = "Select inner parameter" },
            ["as"] = { query = "@statement.outer", desc = "Select outer statement" },
            ["is"] = { query = "@statement.inner", desc = "Select inner statement" },
          },
        },
        swap = {
          enable = true,
          swap_previous = {
            ["<leader>A"] = { query = "@parameter.inner", desc = "Swap with previous parameter" },
          },
          swap_next = {
            ["<leader>a"] = { query = "@parameter.inner", desc = "Swap with next parameter" },
          },
        },
      },
    },
    keys = {
      {
        "gs",
        select_next_sibling,
        mode = { "x", "v" },
        desc = "next sibling",
      },
      {
        "gS",
        select_prev_sibling,
        mode = { "x", "v" },
        desc = "previous sibling",
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
