return {
  {
    "github/copilot.vim",
    build = ":Copilot setup",
    event = "LspAttach",
    config = function()
      return "<cmd>Copilot enable<cr>"
    end,
  },
}
