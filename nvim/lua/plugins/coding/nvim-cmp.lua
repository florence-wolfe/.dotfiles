return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter " },
    dependencies = {
      { "hrsh7th/cmp-cmdline" },
      { "dmitmel/cmp-cmdline-history" },
      { "hrsh7th/cmp-emoji" },
      { "hrsh7th/cmp-nvim-lua" },
      { "tzachar/cmp-fuzzy-buffer", dependencies = { "tzachar/fuzzy.nvim" } },
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      local compare = require("cmp.config.compare")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, {
        { name = "emoji" },
        { name = "nvim_lua", include_deprecated = true },
        { name = "cmdline_history" },
        { name = "cmdline" },
        { name = "fuzzy_buffer" },
      }))
      opts.completion.border = "rounded"
      opts.sorting = {
        priority_weight = 2,
        comparators = {
          require("cmp_fuzzy_buffer.compare"),
          compare.offset,
          compare.exact,
          compare.score,
          compare.recently_used,
          compare.kind,
          compare.sort_text,
          compare.length,
          compare.order,
        },
      }
      opts.window = {
        completion = cmp.config.window.bordered({
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        }),
        documentation = cmp.config.window.bordered({
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        }),
      }
      opts.experimental = {
        ghost_text = false,
      }
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end

      -- TODO: Get this working eventually
      --[[ opts.completion.autocomplete = {
        function()
          if vim.api.nvim_buf_get_lines(0, vim.fn.line(".") - 1, vim.fn.line("."), false)[1]:match("^%s*$") then
            return false
          end
          return true
        end,
      } ]]
    end,
    config = function(_, opts)
      local cmp = require("cmp")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      local sources_cmdline = {
        { name = "path" },
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
        { name = "cmdline_history" },
      }

      -- Setup sources for search
      local sources_search = {
        { name = "buffer" },
        { name = "cmdline_history" },
        { name = "path" },
        { name = "fuzzy_buffer" },
      }

      -- Combine configurations for both cmdline and cmdline-history
      for _, cmd_type in ipairs({ ":", "/", "?", "@" }) do
        local sources = cmd_type == ":" and sources_cmdline or sources_search
        cmp.setup.cmdline(cmd_type, {
          mapping = cmp.mapping.preset.cmdline(),
          sources = sources,
        })
      end
      cmp.setup(opts)
    end,
  },
}
