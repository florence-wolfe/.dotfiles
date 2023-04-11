return {
  {
    "nathom/filetype.nvim",
    opts = {
      overrides = {
        extensions = {
          -- Set the filetype of *.pn files to potion
          rc = "sh",
        },
      },
    },
    config = function(_, opts)
      require("filetype").setup(opts)
    end,
  },
  { "lewis6991/impatient.nvim" },
}
