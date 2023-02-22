-- Implement delta as previewer for diffs

local previewers = require("telescope.previewers")
local builtin = require("telescope.builtin")
local conf = require("telescope.config")
local E = {}

local delta = previewers.new_termopen_previewer({
  get_command = function(entry)
    return {
      "git",
      "-c",
      "core.pager=delta",
      "-c",
      "delta.side-by-side=false",
      "diff",
      entry.value .. "^!",
      "--",
      entry.current_file,
    }
  end,
})

E.delta_git_commits = function(opts)
  opts = opts or {}
  opts.previewer = delta

  builtin.git_commits(opts)
end

E.delta_git_bcommits = function(opts)
  opts = opts or {}
  opts.previewer = delta

  builtin.git_bcommits(opts)
end

return E
