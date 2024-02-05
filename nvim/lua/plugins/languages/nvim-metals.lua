return {
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ft = { "scala", "sbt", "java" },
    options = {
      showImplicitArguments = true,
      showImplicitConversionsAndClasses = true,
      showInferredType = true,
      excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
    },
    config = function(_, opts)
      local metals = require("metals")
      metals.initialize_or_attach(vim.tbl_deep_extend("force", metals.bare_config(), {
        handlers = {
          ["metals/status"] = function(_, status, ctx)
            vim.lsp.handlers["$/progress"](_, {
              token = 1,
              value = {
                kind = status.show and "begin" or status.hide and "end" or "report",
                message = status.text,
              },
            }, ctx)
          end,
        },
        init_options = {
          statusBarProvider = "on",
        },
        settings = opts,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      }))
    end,
  },
}
