return {
  {
    "VidocqH/lsp-lens.nvim",
    opts = {
      enable = false,
      include_declaration = false, -- Reference include declaration
      sections = { -- Enable / Disable specific request
        definition = false,
        references = true,
        implementation = true,
      },
    },
    config = function(_, opts)
      require("lsp-lens").setup(opts)
    end,
  },
}
