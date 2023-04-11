return {
  {
    "folke/noice.nvim",
    opts = {
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
      },
    },
  },
}
