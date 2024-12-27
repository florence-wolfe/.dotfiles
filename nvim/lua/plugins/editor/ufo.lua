return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "BufRead",
    keys = {
      {
        "K",
        function()
          local success, ufo = pcall(require, "ufo")
          local winid = success and ufo.peekFoldedLinesUnderCursor() or nil
          if not winid then
            vim.lsp.buf.hover()
          end
        end,
        desc = "Hover/Peek folds",
        noremap = true,
      },
      {
        "zZ",
        function()
          require("ufo").peekFoldedLinesUnderCursor()
        end,
        desc = "Peek folds",
      },
    },
    opts = {
      open_fold_hl_timeout = 0,
      provider_selector = function()
        return { "treesitter", "indent" }
      end,
      fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (" ﬋ %d "):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end,
      preview = {
        win_config = {
          winblend = 0,
          winhighlight = "Normal:LazyNormal",
        },
      },
    },
    config = function(_, opts)
      require("ufo").setup(opts)
    end,
  },
}
