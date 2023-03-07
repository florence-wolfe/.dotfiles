local Utils = require("utils")

return {
  {
    "sitiom/nvim-numbertoggle",
    event = {
      "BufEnter",
      "FocusGained",
      "WinEnter",
      "InsertEnter",
      "CmdlineEnter",
    },
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },
  {
    "windwp/nvim-autopairs",
    opts = {
      check_ts = true,
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    init = function()
      Utils.create_keymap_group("<leader>t", "+terminal")
    end,
    opts = {
      size = 20,
      open_mapping = [[<c-\>]],
      start_in_insert = true,
      persist_size = true,
      persist_mode = true,
      close_on_exit = true,
      auto_scroll = true,
      shade_terminals = false,
    },
    keys = {
      { "<leader>t\\", "<cmd>ToggleTerm direction=float<cr>",      desc = "Toggle Term (float)" },
      { "<leader>t-",  "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle Term (horizontal)" },
      { "<leader>t|",  "<cmd>ToggleTerm direction=vertical<cr>",   desc = "Toggle Term (vertical)" },
    },
  },
  {
    "sindrets/diffview.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      {
        "<leader>gd",
        "<cmd>DiffviewOpen<cr>",
        desc = "DiffviewOpen",
      },
      {
        "<leader>gD",
        "<cmd>DiffviewClose<cr>",
        desc = "DiffviewClose",
      },
      {
        "<leader>gH",
        "<cmd>DiffviewFileHistory<cr>",
        desc = "DiffviewFileHistory",
      },
    },
  },
  {
    "mbbill/undotree",
    keys = {
      {
        "<leader>fU",
        "<cmd>UndotreeToggle<cr>",
        desc = "Undotree Toggle",
      },
    },
  },
  { "tiagovla/scope.nvim", event = "VeryLazy", config = true },
}
