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
    opts = function()
      local function handle_provider_selector(_bufnr, filetype)
        local ft_providers = {
          vim = "indent",
          python = { "indent" },
          git = "",
          help = "",
          qf = "",
          fugitive = "",
          fugitiveblame = "",
          ["neo-tree"] = "",
        }

        ---@param bufnr number
        ---@return Promise
        local function customizeSelector(bufnr)
          local function handleFallbackException(err, providerName)
            if type(err) == "string" and err:match("UfoFallbackException") then
              return require("ufo").getFolds(bufnr, providerName)
            else
              return require("promise").reject(err)
            end
          end

          return require("ufo")
            .getFolds(bufnr, "lsp")
            :catch(function(err)
              return handleFallbackException(err, "treesitter")
            end)
            :catch(function(err)
              return handleFallbackException(err, "indent")
            end)
        end

        return ft_providers[filetype] or customizeSelector
      end

      local function handle_fold_virtual_text(virtText, lnum, endLnum, width, truncate)
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
      end

      return {
        open_fold_hl_timeout = 0,
        -- lsp->treesitter->indent fallback
        -- ufo.nvim only supports 1 fallback ootb.
        -- https://github.com/kevinhwang91/nvim-ufo/issues/256
        provider_selector = handle_provider_selector,
        fold_virt_text_handler = handle_fold_virtual_text,
        preview = {
          win_config = {
            winblend = 0,
            winhighlight = "Normal:LazyNormal",
          },
        },
      }
    end,
  },
}
