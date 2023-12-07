return {
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    keys = {
      {
        "<leader>cC",
        function()
          local is_enabled = vim.g.codeium_enabled
          if is_enabled then
            vim.g.codeium_enabled = false
          else
            vim.g.codeium_enabled = true
          end
        end,
        desc = "Toggle Codeium",
      },
    },
  },
}
