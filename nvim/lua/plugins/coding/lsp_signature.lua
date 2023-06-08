return {
  {
    "ray-x/lsp_signature.nvim",
    opts = {
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded",
      },
      hint_inline = function()
        return true
      end,
    },
    keys = {
      {
        "<C-k>",
        function()
          require("lsp_signature").toggle_float_win()
        end,
        { "n", "i" },
        desc = "Toggle signature float window",
      },
    },
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
}
