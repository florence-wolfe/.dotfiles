return {
  {
    "github/copilot.vim",
    enabled = true,
    build = ":Copilot setup",
    event = "LspAttach",
    keys = {
      {
        "<leader>cC",
        function()
          -- Execute ':Copilot status' and capture the output
          local status_output = vim.fn.execute(":Copilot status")

          -- Check if "Enabled and online" appears in the output
          local is_enabled = string.find(status_output, "Enabled and online") and true or false
          if is_enabled then
            vim.fn.execute(":Copilot disable")
          else
            vim.fn.execute(":Copilot enable")
          end
        end,
        desc = "Toggle Copilot",
      },
    },
    config = function()
      return "<cmd>Copilot enable<cr>"
    end,
  },
}
