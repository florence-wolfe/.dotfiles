return {
  {
    "nvimtools/none-ls.nvim",
    enabled = false,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        nls.builtins.code_actions.ts_node_action,
      })
    end,
  },
}
