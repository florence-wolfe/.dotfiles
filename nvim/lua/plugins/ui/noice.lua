return {
  {
    "folke/noice.nvim",
    ---@type NoiceConfig
    opts = {
      popupmenu = {
        -- cmp-cmdline has more sources and can be extended
        backend = "cmp", -- backend to use to show regular cmdline completions
      },
      lsp = {
        -- use fidget instead
        progress = {
          enabled = false,
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
        lsp_doc_border = true, -- add a border to hover docs and signature help
        inc_rename = true, -- add a border to the inc rename window
      },
      routes = {
        {
          filter = {
            find = "Detached buffer",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            kind = "wmsg",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "^nvim%-navic:.*Already attached to %w+",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "^error%(satellite.nvim%):",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "code = %-32801",
          },
          opts = { skip = true },
        },
      },
    },
  },
}
