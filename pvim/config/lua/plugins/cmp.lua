local cmpConfig = require('utils.cmp-config')

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
    dependencies = {
      { "hrsh7th/cmp-emoji" },
      { "hrsh7th/cmp-nvim-lua" },
      { "onsails/lspkind.nvim" }
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")

      opts.sources = cmpConfig.getSources(cmp, opts)
      opts.formatting = cmpConfig.getFormatting()
      opts.mapping = cmpConfig.getMappings(cmp, opts)
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
