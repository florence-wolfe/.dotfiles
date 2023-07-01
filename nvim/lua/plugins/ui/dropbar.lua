return {
  {
    "Bekaboo/dropbar.nvim",
    opts = {
      bar = {
        sources = function(_, _)
          local sources = require("dropbar.sources")
          return {
            {
              get_symbols = function(buf, win, cursor)
                if vim.bo[buf].ft == "markdown" then
                  return sources.markdown.get_symbols(buf, win, cursor)
                end
                for _, source in ipairs({
                  sources.lsp,
                  sources.treesitter,
                }) do
                  local symbols = source.get_symbols(buf, win, cursor)
                  if not vim.tbl_isempty(symbols) then
                    return symbols
                  end
                end
                return {}
              end,
            },
          }
        end,
      },
    },
    config = function(_, opts)
      require("dropbar").setup(opts)
    end,
    event = "VeryLazy",
    keys = {
      {
        "<C-CR>",
        function()
          require("dropbar.api").pick()
        end,
        desc = "Dropbar pick",
      },
    },
  },
}
