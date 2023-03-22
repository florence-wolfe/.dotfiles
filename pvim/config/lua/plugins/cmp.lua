local cmpConf = require("utils.cmp-conf")

return {
  { "tzachar/cmp-fuzzy-path", dependencies = { "hrsh7th/nvim-cmp", "tzachar/fuzzy.nvim" } },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "hrsh7th/cmp-emoji" },
      { "hrsh7th/cmp-nvim-lua" },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")

      opts.sources = cmpConf.getSources(cmp, opts)
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
