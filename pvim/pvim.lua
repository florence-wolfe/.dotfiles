local dir = os.getenv("PVIM")
local on_windows = vim.loop.os_uname().version:match("Windows")
local function join_paths(...)
	local path_sep = on_windows and "\\" or "/"
	for i, v in ipairs({ ... }) do
		if v == nil then
			print("Error: argument " .. i .. " passed to join_paths is nil")
			return ""
		end
	end
	local result = table.concat({ ... }, path_sep)
	return result
end

-- Find the config
local init_path = join_paths(dir, "config", "init.lua")
vim.opt.rtp:append(join_paths(dir, "config"))
local real_require = require
local plugins = {
	["lazy"] = function()
		local lazypath = join_paths(dir, "clutter", "lazy", "lazy", "lazy.nvim")
		if not vim.loop.fs_stat(lazypath) then
			vim.fn.system({
				"git",
				"clone",
				"--filter=blob:none",
				"https://github.com/folke/lazy.nvim.git",
				"--branch=stable", -- latest stable release
				lazypath,
			})
		end
		vim.opt.rtp:prepend(lazypath)
		local lazy_defaults = real_require("lazy.core.config").defaults
		lazy_defaults.root = join_paths(dir, "clutter", "lazy", "lazy")
		lazy_defaults.lockfile = join_paths(dir, "clutter", "lazy", "lazy-lock.json")
		lazy_defaults.performance.rtp.reset = false
		lazy_defaults.performance.rtp.paths = {
			join_paths(dir, "clutter", "lazy", "lazy"),
		}
		lazy_defaults.readme.root = join_paths(dir, "clutter", "state", "lazy", "readme")
	end,
	["mason"] = function()
		real_require("mason").setup({
			install_root_dir = join_paths(dir, "clutter", "mason"),
		})
	end,
}

--overwrite require
function require(plugin)
	if plugins[plugin] then
		--load custom plugin configs before loading plugin
		plugins[plugin]()
		plugins[plugin] = nil --only once
	end
	--run the normal require
	return real_require(plugin)
end

-- Load the config
vim.cmd.source(init_path)

-- overwrite some settings
vim.opt.undodir = join_paths(dir, "clutter", "undo")
vim.opt.swapfile = false
vim.opt.backup = false
