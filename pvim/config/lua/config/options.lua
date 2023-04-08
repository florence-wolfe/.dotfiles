if vim.fn.has("nvim") == 1 then
  local is_wsl = vim.fn.system("uname -r"):lower():find("-microsoft") ~= nil
  if is_wsl and os.getenv("WSL_DISTRO_NAME") ~= nil then
    vim.g.clipboard = {
      name = "WslClipboard",
      copy = {
        ["+"] = "clip.exe",
        ["*"] = "clip.exe",
      },
      paste = {
        ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      },
      cache_enabled = 0,
    }
  end
end

vim.opt.relativenumber = false
vim.opt.list = true
vim.opt.listchars:append("space:·")
vim.opt.listchars:append("eol:¬")
vim.opt.fillchars:append("diff:/")
vim.opt.fillchars:append("foldclose:▸")
vim.opt.fillchars:append("foldopen:▾")
vim.opt.fillchars:append("foldsep:│")
vim.opt.fillchars:append("fold: ")
-- write no format
vim.api.nvim_create_user_command("Wnf", "noa w", {})
vim.opt.foldcolumn = "1" -- '0' is not bad
vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.mousemoveevent = true
vim.opt.showtabline = 2
vim.opt.updatetime = 200
vim.opt.scrolloff = 9999
