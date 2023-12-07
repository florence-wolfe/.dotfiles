local M = {}
M.is_client_active = function()
  local ok, clients = pcall(require("lazyvim.util").lsp.get_clients, { name = "copilot", bufnr = 0 })
  if not ok then
    return false
  end
  return ok and #clients > 0
end

M.name = "Copilot"
M.icon = ""

return M
