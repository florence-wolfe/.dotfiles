return {
  {
    "aznhe21/actions-preview.nvim",
    dependencies = { { "nvim-telescope/telescope.nvim" } },
    config = true,
    keys = {
      {
        "<leader>ca",
        function()
          require("actions-preview").code_actions()
        end,
        desc = "Code Actions",
      },
    },
  },
}
