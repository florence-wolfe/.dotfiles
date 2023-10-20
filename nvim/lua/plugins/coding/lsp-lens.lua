return {
  {
    "VidocqH/lsp-lens.nvim",
    cmd = { "LspLensOn", "LspLensOff", "LspLensToggle" },
    event = "LspAttach",
    opts = {
      include_declaration = true, -- Reference include declaration
      sections = {
        definition = true,
        references = true,
        implementation = true,
      },
      ignore_filetype = {
        "prisma",
      },
    },
  },
}
