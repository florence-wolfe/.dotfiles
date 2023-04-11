return {
  {
    "VonHeikemen/searchbox.nvim",
    dependencies = {
      { "MunifTanjim/nui.nvim" },
    },
    keys = {
      {
        "gR",
        -- [[:let @/='<C-r>=expand('<cword>')<CR>'<CR>:SearchBoxReplace<CR><C-r>/<CR>]],
        function()
          local nvim = vim.api
          -- Get the word under the cursor
          local word_under_cursor = nvim.nvim_call_function("expand", { "<cword>" })
          -- Set the search register `/` to the word under the cursor
          nvim.nvim_set_var("/", word_under_cursor)

          -- Execute the custom command SearchBoxReplace
          nvim.nvim_command("SearchBoxReplace confirm=menu")

          -- Insert the content of the search register `/` into the command line
          local keys = nvim.nvim_replace_termcodes("<C-r>/<CR>", true, false, true)
          nvim.nvim_feedkeys(keys, "n", false)
          -- Unset the / register since we used it in the replace already
          nvim.nvim_del_var("/")
        end,
        desc = "Search & Replace current word",
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
            modified = ":C\v",
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
            modified = ":C\v",
          })
        end,
        mode = "x",
        desc = "Search & Replace selection",
      },
    },
  },
}
