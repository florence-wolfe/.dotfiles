return {
  {
    "piersolenski/wtf.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      -- TODO: DONT COMMIT THIS
      openai_api_key = "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",
      additional_instructions = "",
    },
    config = function(_, opts)
      require("wtf").setup(opts)
    end,
    keys = {
      {
        "gw",
        mode = { "n", "x" },
        function()
          require("wtf").ai()
        end,
        desc = "Debug diagnostic with AI",
      },
      {
        mode = { "n" },
        "gW",
        function()
          require("wtf").search()
        end,
        desc = "Search diagnostic with Google",
      },
    },
  },
}
