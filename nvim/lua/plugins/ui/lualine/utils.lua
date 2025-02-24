local M = {}

local function get_color_from_hl_group(hl_group)
  return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(hl_group)), "fg")
end

---@class Opts
---@field is_client_active fun():boolean
---@field name string
---@field icon string
---@field extras? string

---@param opts Opts
M.get_completion_status = function(opts)
  local is_active = opts.is_client_active()
  local green = get_color_from_hl_group("DiagnosticOk")
  local red = get_color_from_hl_group("DiagnosticError")
  -- Set the color and icon based on the Copilot status
  local color_code = is_active and green or red

  -- Define the highlight group with the correct color
  vim.cmd(string.format("highlight Lualine" .. opts.name .. "Status guifg=%s" .. (opts.extras or ""), color_code))
  -- Return the formatted status string
  return string.format("%%#Lualine" .. opts.name .. "Status#%s", opts.icon)
end

return M
