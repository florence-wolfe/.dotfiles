return {
  { "tzachar/cmp-fuzzy-path", dependencies = { "hrsh7th/nvim-cmp", "tzachar/fuzzy.nvim" } },
  {
    "jcdickinson/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "hrsh7th/nvim-cmp",
    },
    init = function()
      require("codeium").setup({})
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { { "hrsh7th/cmp-emoji" }, { "hrsh7th/cmp-nvim-lua" } },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local lspkind = require("lspkind")

      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "emoji" },
        { name = "nvim_lua",  include_deprecated = true },
        { name = "codeium" },
        { name = "fuzzy_path" },
      }))
      opts.formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text", -- show only symbol annotations
          maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          symbol_map = { Codeium = "" },

          -- The function below will be called before any actual modifications from lspkind
          -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          before = function(_, vim_item)
            return vim_item
          end,
        }),
      }
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
