return {
  {
    "gregorias/coerce.nvim",
    config = function()
      local coerce = require("coerce")
      local conversion_m = require("coerce.conversion")
      local case_m = require("coerce.case")
      -- New list to hold the modified elements
      local modes = {
        { vim_mode = "n", keymap_prefix = "co", selector = conversion_m.select_current_word },
        { vim_mode = "n", keymap_prefix = "go", selector = conversion_m.select_with_motion },
        { vim_mode = "v", keymap_prefix = "go", selector = conversion_m.select_current_visual_selection },
      }
      local cases = {
        {
          keymap = "f",
          case = function(str)
            local lower = vim.fn.tolower(str)
            return (lower:gsub("^%l", string.upper))
          end,
          description = "Start case",
        },
        { keymap = "c", case = case_m.to_camel_case, description = "camelCase" },
        { keymap = "d", case = case_m.to_dot_case, description = "dot.case" },
        { keymap = "k", case = case_m.to_kebab_case, description = "kebab-case" },
        { keymap = "n", case = case_m.to_numerical_contraction, description = "numeronym (n7m)" },
        { keymap = "p", case = case_m.to_pascal_case, description = "PascalCase" },
        { keymap = "s", case = case_m.to_snake_case, description = "snake_case" },
        { keymap = "S", case = case_m.to_upper_case, description = "UPPER_SNAKE" },
        { keymap = "/", case = case_m.to_path_case, description = "path/case" },
        {
          keymap = "u",
          case = function(str)
            return vim.fn.toupper(str)
          end,
          description = "uppercase",
        },
        {
          keymap = "l",
          case = function(str)
            return vim.fn.tolower(str)
          end,
          description = "lowercase",
        },
      }

      coerce.setup({
        cases = cases,
        modes = modes,
      })
    end,
  },
}
