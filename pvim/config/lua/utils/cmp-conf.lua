local M = {}

M.getSources = function(cmp, opts)
  return cmp.config.sources(vim.list_extend(opts.sources, {
    { name = "emoji" },
    { name = "nvim_lua", include_deprecated = true },
    { name = "fuzzy_path" },
  }))
end

return M
