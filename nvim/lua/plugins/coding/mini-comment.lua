local function toggle_comment()
  local minicomment = require("mini.comment")
  return minicomment.operator() .. "_"
end

return {
  {
    "echasnovski/mini.comment",
    keys = {
      {
        "<c-/>",
        function()
          if vim.fn.mode() == "i" then
            return "<c-o>" .. toggle_comment()
          else
            return toggle_comment()
          end
        end,
        expr = true,
        mode = { "n", "i" },
        desc = "comment toggle",
      },
    },
  },
}
