return {
  {
    "rcarriga/nvim-notify",
    lazy = false,
    priority = 950,
    config = function()
      local notify = require("notify")
      notify.setup({
        background_colour = "#0a1929",
        fps = 60,
        render = "compact",
        stages = "slide",
        timeout = 2500,
        minimum_width = 25,
        max_width = 40,
        max_height = 5,
        top_down = true,
        icons = {
          ERROR = "",
          WARN = "",
          INFO = "",
          DEBUG = "",
          TRACE = "✎",
        },
        border = { style = "rounded", padding = { 0, 1 } },
      })
      vim.notify = notify
    end,
  },
}
