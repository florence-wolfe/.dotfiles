local utils = require("utils")

return {
  -- Task runner for Neovim
  "stevearc/overseer.nvim",
  cmd = { "OverseerRun", "OverseerRestartLast", "OverseerToggle" },
  opts = {
    strategy = {
      "toggleterm",
      use_shell = false,
      auto_scroll = true,
      close_on_exit = false,
      open_on_start = true,
      hidden = false,
    },
    task_list = {
      default_detail = 1,
      max_width = { 100, 0.2 },
      min_width = { 40, 0.1 },
      width = nil,
      direction = "right",
      bindings = {
        ["?"] = "ShowHelp",
        ["<CR>"] = "RunAction",
        ["<C-e>"] = "Edit",
        ["o"] = "Open",
        ["<C-v>"] = "OpenVsplit",
        ["<C-s>"] = "OpenSplit",
        ["<C-f>"] = "OpenFloat",
        ["<C-q>"] = "OpenQuickFix",
        ["p"] = "TogglePreview",
        ["zo"] = "IncreaseDetail",
        ["zc"] = "DecreaseDetail",
        ["zO"] = "IncreaseAllDetail",
        ["zC"] = "DecreaseAllDetail",
        ["["] = "DecreaseWidth",
        ["]"] = "IncreaseWidth",
        ["{"] = "PrevTask",
        ["}"] = "NextTask",
      },
    },
  },
  keys = {
    { "<leader>ol", "<cmd>OverseerRun<cr>", desc = "List tasks in project" },
    { "<leader>or", "<cmd>OverseerRestartLast<cr>", desc = "Restart last task" },
    { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle summary window" },
  },
  init = function()
    utils.create_keymap_group("<leader>o", "+overseer")
  end,
  config = function(_, opts)
    require("overseer").setup(opts)
  end,
}
