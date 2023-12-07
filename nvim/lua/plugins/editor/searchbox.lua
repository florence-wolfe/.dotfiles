return {
  {
    "VonHeikemen/searchbox.nvim",
    dependencies = {
      { "MunifTanjim/nui.nvim" },
    },
    keys = {
      {
        "gR",
        function()
          local current_word = vim.fn.expand("<cword>")
          require("searchbox").replace({
            confirm = "native",
            visual_mode = false,
            show_matches = true,
            case_sensitive = false,
            default_value = current_word,
            -- stylua-ignore
            modified = ":C\\v",
          })
        end,
        mode = "n",
        desc = "Replace word under cursor",
      },
      {
        "<leader>r",
        function()
          require("searchbox").replace({
            confirm = "menu",
            visual_mode = false,
            show_matches = true,
            case_sensitive = false,
            -- stylua-ignore
            modified = ":C\\v",
          })
        end,
        mode = "n",
        desc = "Search & Replace buffer",
      },
      {
        "<leader>r",
        function()
          require("searchbox").replace({
            confirm = "menu",
            visual_mode = true,
            show_matches = true,
            case_sensitive = false,
            -- stylua-ignore
            modified = ":C\\v",
          })
        end,
        mode = "x",
        desc = "Search & Replace selection",
      },
    },
  },
}
