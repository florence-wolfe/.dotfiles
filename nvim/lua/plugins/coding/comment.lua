return {
  {
    "numToStr/Comment.nvim",
    enabled = true,
    opts = {
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    },
    event = "LspAttach",
    keys = {
      {
        "<C-/>",
        function()
          require("Comment.api").toggle.linewise.current()
        end,
        mode = { "n", "i", "v" },
        desc = "Comment toggle",
      },
      {
        "<C-.>",
        function()
          require("Comment.api").toggle.blockwise(vim.fn.visualmode())
        end,
        mode = "v",
        desc = "Toggle blockwise comment",
      },
    },
    config = function(_, opts)
      require("Comment").setup(opts)
      vim.keymap.del("n", "gc")
      vim.keymap.del("n", "gb")
      local wk = require("which-key")
      wk.add({
        { "gb", group = "Comment toggle blockwise" },
        { "gc", group = "Comment toggle linewise" },
      })
    end,
  },
}
