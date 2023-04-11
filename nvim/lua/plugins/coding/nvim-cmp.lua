return {
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = { "InsertEnter", "CmdlineEnter " },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      { "hrsh7th/cmp-cmdline" },
      { "dmitmel/cmp-cmdline-history" },
      { "hrsh7th/cmp-emoji" },
      { "hrsh7th/cmp-nvim-lua" },
      { "tzachar/cmp-fuzzy-buffer", dependencies = { "tzachar/fuzzy.nvim" } },
    },
    opts = function()
      local cmp = require("cmp")
      local compare = require("cmp.config.compare")
      return {
        window = {
          completion = cmp.config.window.bordered({
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
          }),
        },
        completion = {
          border = "rounded",
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
          { name = "emoji" },
          { name = "nvim_lua", include_deprecated = true },
          { name = "cmdline_history" },
          { name = "cmdline" },
          { name = "fuzzy_buffer" },
        }),
        formatting = {
          format = function(_, item)
            local icons = require("lazyvim.config").icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        sorting = {
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
        },
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
      }
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
