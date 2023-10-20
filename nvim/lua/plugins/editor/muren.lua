return {
  "AckslD/muren.nvim",
  event = {
    { "BufNewFile", "BufAdd" },
  },
  config = true,
  cmd = "MurenToggle",
  keys = {
    {
      "<leader>R",
      function()
        local plugin = require("lazy.core.config").spec.plugins["mini.move"]
        local opts = require("lazy.core.plugin").values(plugin, "opts", false)
        require("muren.api").open_ui({})
      end,
      desc = "Replace",
    },
  },
}
