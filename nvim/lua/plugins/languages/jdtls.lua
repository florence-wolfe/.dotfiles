return {
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      settings = {
        java = {
          autobuild = { enabled = true },
          configuration = {
            updateBuildConfiguration = "automatic",
          },
        },
      },
    },
  },
}
