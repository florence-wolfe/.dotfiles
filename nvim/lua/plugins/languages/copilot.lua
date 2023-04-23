return {
  {
    "github/copilot.vim",
    enabled = true,
    build = ":Copilot setup",
    event = "LspAttach",
    config = function()
      return "<cmd>Copilot enable<cr>"
    end,
  },
}
