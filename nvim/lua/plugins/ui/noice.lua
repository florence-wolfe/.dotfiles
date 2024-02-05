local function scroll_lsp_popups(key, scroll_height)
  return {
    key,
    function()
      if not require("noice.lsp").scroll(scroll_height) then
        return key
      end
    end,
    mode = { "n", "i", "s" },
    silent = true,
    expr = true,
  }
end
return {
  {
    "folke/noice.nvim",
    ---@type NoiceConfig
    keys = {
      -- scroll lsp popups
      scroll_lsp_popups("<C-f>", 4),
      scroll_lsp_popups("<C-b>", -4),
    },
    opts = {
      messages = {
        enabled = true,
        view = "notify",
        view_error = "notify",
        view_warn = "notify",
        view_history = "messages",
        view_search = false,
      },
      notify = {
        view = "mini",
      },
      popupmenu = {
        -- cmp-cmdline has more sources and can be extended
        backend = "cmp", -- backend to use to show regular cmdline completions
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        -- use fidget instead
        progress = {
          enabled = true,
        },
        hover = {
          silent = true, -- set to true to not show a message if hover is not available
        },
        signature = {
          auto_open = {
            -- disable the auto-opened signature helper in insert mode
            trigger = false, -- Automatically show signature help when typing a trigger character from the LSP
            luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
          },
        },
      },
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true, -- add a border to hover docs and signature help
        inc_rename = true, -- add a border to the inc rename window
      },
      views = {
        split = {
          win_options = { wrap = false },
          size = 16,
          close = { keys = { "q", "<CR>", "<Esc>" } },
        },
        popup = {
          win_options = { wrap = false },
        },
      },
      routes = {
        { filter = { event = "msg_show", kind = "print" }, opts = { skip = true } },
        { -- route long messages to split
          filter = {
            event = "msg_show",
            any = { { min_height = 5 }, { min_width = 200 } },
            ["not"] = {
              kind = { "confirm", "confirm_sub", "return_prompt", "quickfix", "search_count" },
            },
            blocking = false,
          },
          view = "messages",
          opts = { stop = true },
        },
        { -- route long messages to split
          filter = {
            event = "msg_show",
            any = { { min_height = 5 }, { min_width = 200 } },
            ["not"] = {
              kind = { "confirm", "confirm_sub", "return_prompt", "quickfix", "search_count" },
            },
            blocking = true,
          },
          view = "mini",
        },
        -- Hide annoying messages
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "Detached buffer" },
              { kind = "wmsg" },
              { find = "^nvim%-navic:.*Already attached to %w+" },
              { find = "^error%(satellite.nvim%):" },
              { find = "code = %-32801" },
              { find = "attempt to index local 'request' %(a nil value%)" },
              { find = "^%[.*%] .*$" },
              { find = "E592: 'winwidth' cannot be smaller than 'winminwidth'" },
            },
          },
          opts = { skip = true },
        },
      },
    },
  },
}
