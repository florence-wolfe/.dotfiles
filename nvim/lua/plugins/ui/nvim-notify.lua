return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  keys = {
    {
      "<leader>uN",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss notify messages",
    },
  },
  opts = {
    timeout = 3000,
    render = "compact",
  },
}
