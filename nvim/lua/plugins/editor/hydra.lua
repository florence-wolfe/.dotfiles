return {
  "anuvyklack/hydra.nvim",
  enabled = false,
  opts = {
    hydras = {
      {
        name = "Side-Scroll",
        mode = "n",
        body = "<leader>z",
        config = {
          desc = "Hydra side-scroll",
          invoke_on_body = true, -- Enable the heads when you press the body keys
          hint = {
            type = "window",
            position = "top-right",
          },
        },
        heads = {
          { "h", "5zh", { desc = "5" } },
          { "l", "5zl", { desc = "5" } },
          { "H", "zH", { desc = "1/2 screen " } },
          { "L", "zL", { desc = "1/2 screen " } },
          { "q", nil, { exit = true, nowait = true } },
          { "<Esc>", nil, { exit = true, nowait = true } },
        },
      },
    },
  },
  config = function(_, opts)
    local Hydra = require("hydra")

    for _, hydra in ipairs(opts.hydras) do
      hydra.config.color = "pink"
      hydra.config.on_enter = function()
        require("lualine").refresh()
      end
      hydra.config.on_exit = function()
        print("Hydra exited")
        require("lualine").refresh()
      end
      Hydra(hydra)
    end
  end,
}
