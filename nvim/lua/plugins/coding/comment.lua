return {
  {
    "numToStr/Comment.nvim",
    enabled = false,
    opts = {
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    },
    keys = {
      {
        "<C-/>",
        "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>",
        mode = { "n", "i" },
        desc = "Comment toggle",
      },
    },
    config = function(_, opts)
      require("Comment").setup(opts)
    end,
  },
}
