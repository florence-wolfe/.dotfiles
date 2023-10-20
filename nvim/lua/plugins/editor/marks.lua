local utils = require("utils")
return {
  {
    "chentoast/marks.nvim",
    event = "BufRead",
    init = function()
      utils.create_keymap_group("<leader>m", "+marks")
    end,
    keys = {
      { "<leader>mb", "<Cmd>MarksListBuf<CR>", desc = "List buffer marks" },
      { "<leader>mB", "<Cmd>MarksListBuf<CR>", desc = "List all buffer marks" },
      { "<leader>mg", "<Cmd>MarksListGlobal<CR>", desc = "List global marks" },
      --[[ set_next = "m,",
  toggle = "m;",
  next = "m]",
  prev = "m[",
  preview = "m:",
  next_bookmark = "m}",
  prev_bookmark = "m{",
  delete = "dm",
  delete_line = "dm-",
  delete_bookmark = "dm=",
  delete_buf = "dm<space>" ]]
    },
    opts = {
      excluded_filetypes = {
        "DressingInput",
        "gitcommit",
        "NeogitCommitMessage",
        "NeogitNotification",
        "NeogitStatus",
        "NeogitStatus",
        "NvimTree",
        "Outline",
        "OverseerForm",
        "dropbar_menu",
        "lazy",
        "lspinfo",
        "megaterm",
        "neo-tree",
        "neo-tree-popup",
        "noice",
        "notify",
        "null-ls-info",
        "registers",
        "toggleterm",
        "toggleterm",
      },
      bookmark_0 = { sign = "󰈻", virt_text = "" },
      mappings = { annotate = "m?" },
    },
    config = function(_, opts)
      require("marks").setup(opts)
    end,
  },
}
