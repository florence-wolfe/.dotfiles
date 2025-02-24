-- Get current opened directory from state.
---@param state table
---@return string
local function get_current_directory(state)
  local node = state.tree:get_node()
  local path = node.path
  if node.type ~= "directory" or not node:is_expanded() then
    local path_separator = package.config:sub(1, 1)
    path = path:match("(.*)" .. path_separator)
  end
  return path
end

local function get_current_node_name(state)
  local node = state.tree:get_node()
  local name = node.name
  -- TODO: Add a picker to select between relative, absolute, or none
  vim.print("Copied: " .. name)
  vim.fn.setreg("+", name)
  require("yanky").yank()
end

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = true,
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, position = "right" })
        end,
        desc = "Toggle file explorer (right)",
      },
      {
        "-",
        function()
          require("neo-tree.command").execute({ toggle = true, position = "right" })
        end,
        desc = "Toggle file explorer (right)",
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({ toggle = true, position = "float" })
        end,
        desc = "Toggle file explorer (float)",
      },
    },
    opts = {
      source_selector = {
        winbar = true,
      },
      window = {
        position = "right",
      },
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.cmd([[setlocal relativenumber]])
          end,
        },
        {
          event = "neo_tree_buffer_leave",
          handler = function()
            vim.cmd([[setlocal norelativenumber]])
          end,
        },
        {
          event = "file_added",
          handler = function(file_path)
            -- Check if the path is not a directory
            if vim.fn.isdirectory(file_path) == 0 then
              -- It's a file, so open it in a new buffer
              vim.cmd("edit " .. file_path)
            end
          end,
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
        bind_to_cwd = true,
        filtered_items = {
          visible = false, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
          hide_dotfiles = true,
          hide_gitignored = true,
        },
        window = {
          mappings = {
            ["/"] = "noop",
            -- ["gf"] = function(state)
            --   require("telescope.builtin").find_files({
            --     cwd = get_current_directory(state),
            --   })
            -- end,
            -- ["gr"] = function(state)
            --   require("telescope.builtin").live_grep({
            --     cwd = get_current_directory(state),
            --   })
            -- end,
            ["c"] = {
              "copy",
              config = {
                show_path = "relative", -- "none", "relative", "absolute"
              },
            },
            ["a"] = {
              "add",
              config = {
                show_path = "relative", -- "none", "relative", "absolute"
              },
            },
            ["A"] = {
              "add_directory",
              config = {
                show_path = "relative", -- "none", "relative", "absolute"
              },
            },
            ["m"] = {
              "move",
              config = {
                show_path = "relative", -- "none", "relative", "absolute"
              },
            },
            ["Y"] = function(state)
              get_current_node_name(state)
            end,
            ["<C-s>"] = "open_vsplit",
            ["s"] = function()
              require("flash").jump()
            end,
          },
        },
      },
    },
  },
}
