return {
  "gelguy/wilder.nvim",
  opts = {
    modes = { ":", "/", "?" },
  },
  config = function()
    local wilder = require("wilder")
    wilder.set_option(
      "renderer",
      wilder.popupmenu_renderer({
        -- highlighter applies highlighting to the candidates
        highlighter = wilder.basic_highlighter(),
      })
    )
  end,
}
