return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.formatting.prettierd)
      table.insert(
        opts.sources,
        nls.builtins.diagnostics.eslint_d.with({
          method = nls.methods.DIAGNOSTICS_ON_SAVE,
        })
      )
      table.insert(opts.sources, nls.builtins.code_actions.eslint_d)
      table.insert(
        opts.sources,
        nls.builtins.code_actions.gitsigns.with({
          config = {
            filter_actions = function(title)
              return title:lower():match("blame") == nil -- filter out blame actions
            end,
          },
        })
      )
    end,
  },
}
