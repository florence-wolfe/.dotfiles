local themes = { "catppuccin", "tokyonight" }

local M = {}

M.theme = themes[2]

M.lualine = M.theme
M.barbecue = M.theme
M.lazyvim = M.theme
M.bufferline = function()
  if M.theme == "catppuccin" then
    return require("catppuccin.groups.integrations.bufferline").get()
  end
end

return M
