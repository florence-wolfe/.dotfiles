local M = {}

local function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

M.is_client_active = function()
  local status = vim.fn["codeium#GetStatusString"]()
  local is_global_enabled = vim.g.codeium_enabled ~= nil and vim.g.codeium_enabled
  local is_status_on = trim(tostring(status)) ~= "OFF"

  return is_global_enabled or is_status_on
end

M.name = "Codeium"
M.icon = "{…}"

return M
