local M = {}

function M.toggle_lsp_hover()
  local lsp_hover_enabled = false

  return function()
    lsp_hover_enabled = not lsp_hover_enabled
    if lsp_hover_enabled then
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
    else
      vim.lsp.handlers["textDocument/hover"] = function() end
    end
  end
end

return M
