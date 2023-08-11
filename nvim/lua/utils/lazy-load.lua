local function generate_import_entries(path)
  local entries = {}

  -- get the Neovim configuration directory
  local config_dir = vim.fn.stdpath("config")

  -- resolve the relative path
  local resolved_path = config_dir .. "/" .. path

  -- normalize the input path
  local normalized_path = vim.fn.fnamemodify(resolved_path, ":p")

  -- extract the relevant path and replace forward slashes with dots, and remove leading 'lua/'
  local function format_path(p)
    -- Handle both forward and backward slashes
    p = p:gsub("\\", "/")

    -- extract the relevant path, e.g., 'lua/plugins/coding' from the absolute path
    local relevant_path = p:match(".*/(lua/plugins/.*)")
    if relevant_path then
      return relevant_path:gsub("/", "."):gsub("^lua%.", ""):gsub("%.+", ".")
    else
      -- Handle the case where the pattern doesn't match (returns nil)
      return nil
    end
  end

  -- iterate over the directories in the given path
  local dirs = vim.fn.glob(normalized_path .. "/*", 1, 1)
  for i = 1, #dirs do
    local dir = dirs[i]
    if vim.fn.isdirectory(dir) == 1 then
      local import_path = format_path(dir)
      if import_path then
        table.insert(entries, { import = import_path })
      else
        -- Handle the case where import_path is nil (e.g., log a warning or error)
        -- For now, it simply prints a warning message; you can replace this with your desired handling
        print("Warning: Failed to format path " .. dir)
      end
    end
  end

  return entries
end

local ignore_patterns = {}

return {
  generate_import_entries = generate_import_entries,
  ignore_patterns = ignore_patterns,
}

