function cycle_dropbar(direction)
  local api = require("dropbar.api")
  local dropbar = api.get_current_dropbar()
  local menu = api.get_current_dropbar_menu()

  print(vim.inspect(dropbar))
  print(vim.inspect(menu))
  if not menu or not menu.is_opened then
    return
  end

  if direction == "next" then
    dropbar.select_next_context()
  end
end

return {
  {
    "Bekaboo/dropbar.nvim",
    config = function(_, opts)
      require("dropbar").setup(opts)
    end,
    event = "VeryLazy",
    keys = {
      {
        "<C-CR>",
        function()
          require("dropbar.api").pick()
        end,
        desc = "Dropbar pick",
      },
    },
  },
}
