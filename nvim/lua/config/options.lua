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
-- ShellOut is an alias for the :r! command so that you can use it in the way
vim.api.nvim_create_user_command("ShellOut", function(opts)
  local cmd = table.concat(opts.fargs, " ") -- Concatenate the arguments to form the complete shell command
  vim.cmd("r !" .. cmd) -- Run the shell command and insert its output into the buffer
end, { nargs = "+" }) -- The command expects one or more arguments;
vim.opt.foldcolumn = "1" -- '0' is not bad
vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.mousemoveevent = true
vim.opt.showtabline = 2
vim.opt.updatetime = 200
vim.opt.scrolloff = 9999
vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.opt.spellfile = vim.fn.expand("~/.dotfiles/pvim/config/en.add")
vim.opt.spelloptions = "camel"

vim.api.nvim_create_user_command("OverseerRestartLast", function()
  local overseer = require("overseer")
  local tasks = overseer.list_tasks({ recent_first = true })
  if vim.tbl_isempty(tasks) then
    vim.notify("No tasks found", vim.log.levels.WARN)
  else
    overseer.run_action(tasks[1], "restart")
  end
end, {})

if vim.g.neovide then
  vim.o.guifont = "IntoneMono Nerd Font Mono"
  vim.g.neovide_confirm_quit = true
  local os = require("os")

  local HOME = os.getenv("HOME") or os.getenv("USERPROFILE")

  local vim_enter_group = vim.api.nvim_create_augroup("vim_enter_group", { clear = true })

  vim.api.nvim_create_autocmd({ "VimEnter" }, { pattern = "*", command = "cd " .. HOME, group = vim_enter_group })
end

function print_copilot_vars()
  print("Global variables starting with 'copilot':")
  for k, _ in pairs(vim.g) do
    if k:match("^copilot") then
      print(k)
    end
  end

  print("Buffer variables starting with 'copilot':")
  for k, _ in pairs(vim.b) do
    if k:match("^copilot") then
      print(k)
    end
  end
end
